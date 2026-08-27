<?php
// notify.php
// Terima sinyal fault dari firmware -> cari siapa yang perlu diberi tahu
// (dari Firebase) -> kirim notifikasi push lewat FCM.
//
// PENTING: file service-account.json (didownload dari Firebase Console)
// HARUS diupload ke folder yang SAMA dengan file ini, TIDAK BOLEH bisa
// diakses langsung dari browser (idealnya taruh di luar folder publik,
// atau minimal pastikan nama filenya tidak gampang ditebak orang lain).

header('Content-Type: application/json');

if($_SERVER['REQUEST_METHOD'] === 'OPTIONS'){
    exit;
}

// ============================================
// KONFIGURASI
// ============================================
// service-account.json TIDAK ditaruh di folder ini (folder ini bisa diakses
// browser) - tapi 2 folder ke atas, DI LUAR public_html, supaya tidak bisa
// dibuka lewat link sama sekali. PHP tetap bisa baca karena jalan di server.
$serviceAccountPath = __DIR__ . '/../../service-account.json';
$databaseUrl = 'https://ladangwohijo-2cdfb-default-rtdb.asia-southeast1.firebasedatabase.app';

// ============================================
// Terima data dari firmware
// ============================================
$input = json_decode(file_get_contents('php://input'), true);

if(!$input || !isset($input['deviceId']) || !isset($input['message'])){
    http_response_code(400);
    echo json_encode(['error' => 'Data tidak lengkap']);
    exit;
}

$deviceId = $input['deviceId'];
$message  = $input['message'];

// ============================================
// Baca service account JSON
// ============================================
if(!file_exists($serviceAccountPath)){
    http_response_code(500);
    echo json_encode(['error' => 'service-account.json belum diupload']);
    exit;
}

$serviceAccount = json_decode(file_get_contents($serviceAccountPath), true);

if(!$serviceAccount || !isset($serviceAccount['private_key']) || !isset($serviceAccount['client_email'])){
    http_response_code(500);
    echo json_encode(['error' => 'service-account.json tidak valid']);
    exit;
}

// ============================================
// Base64url helper (JWT pakai variasi base64 khusus, beda dari base64 biasa)
// ============================================
function base64url_encode($data){
    return rtrim(strtr(base64_encode($data), '+/', '-_'), '=');
}

// ============================================
// Buat JWT, tukar jadi OAuth2 access token dari Google
// Scope ganda: sekali dapat token, dipakai untuk BACA Realtime Database
// (cari token HP siapa yang perlu diberi tahu) DAN KIRIM lewat FCM.
// ============================================
function getGoogleAccessToken($serviceAccount){
    $header = ['alg' => 'RS256', 'typ' => 'JWT'];
    $now = time();
    $claims = [
        'iss'   => $serviceAccount['client_email'],
        'scope' => 'https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/firebase.messaging https://www.googleapis.com/auth/firebase.database',
        'aud'   => 'https://oauth2.googleapis.com/token',
        'exp'   => $now + 3600,
        'iat'   => $now
    ];

    $signingInput = base64url_encode(json_encode($header)) . '.' . base64url_encode(json_encode($claims));

    $signature = '';
    $ok = openssl_sign($signingInput, $signature, $serviceAccount['private_key'], 'SHA256');

    if(!$ok){
        return null;
    }

    $jwt = $signingInput . '.' . base64url_encode($signature);

    $ch = curl_init('https://oauth2.googleapis.com/token');
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query([
        'grant_type' => 'urn:ietf:params:oauth:grant-type:jwt-bearer',
        'assertion'  => $jwt
    ]));

    $response = curl_exec($ch);
    curl_close($ch);

    $data = json_decode($response, true);

    return isset($data['access_token']) ? $data['access_token'] : null;
}

$accessToken = getGoogleAccessToken($serviceAccount);

$logFile = __DIR__ . '/notify_debug.log';
function debugLog($logFile, $msg){
    file_put_contents($logFile, date('Y-m-d H:i:s') . ' - ' . $msg . "\n", FILE_APPEND);
}

if(!$accessToken){
    debugLog($logFile, 'GAGAL dapat access token dari Google');
    http_response_code(500);
    echo json_encode(['error' => 'Gagal dapat access token dari Google']);
    exit;
}

debugLog($logFile, 'Access token OK, cari fcmTokens untuk device: ' . $deviceId);

// ============================================
// Baca daftar token HP yang terdaftar untuk device ini
// PENTING: token OAuth2 dari Service Account harus dikirim lewat HEADER
// Authorization Bearer - BUKAN lewat parameter ?access_token= di URL
// (itu format berbeda, khusus API key/legacy, bukan OAuth2 token ini).
// ============================================
$tokensUrl = $databaseUrl . '/devices/' . urlencode($deviceId) . '/fcmTokens.json';

$ch = curl_init($tokensUrl);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_HTTPHEADER, ['Authorization: Bearer ' . $accessToken]);
$tokensResponse = curl_exec($ch);
$tokensHttpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
$tokensCurlErr = curl_error($ch);
curl_close($ch);

debugLog($logFile, 'Baca fcmTokens - HTTP ' . $tokensHttpCode . ', curl error: ' . ($tokensCurlErr ?: '-') . ', response: ' . $tokensResponse);

$tokensData = json_decode($tokensResponse, true);

// Cek HTTP status EKSPLISIT - supaya respons error (misal {"error":"..."})
// tidak salah dikira daftar token asli hanya karena sama-sama format array.
if($tokensHttpCode !== 200 || !$tokensData || !is_array($tokensData)){
    debugLog($logFile, 'TIDAK ADA TOKEN valid ditemukan (HTTP ' . $tokensHttpCode . ') - notifikasi tidak dikirim');
    echo json_encode(['sent' => 0, 'note' => 'Tidak ada HP terdaftar untuk device ini']);
    exit;
}

debugLog($logFile, 'Ditemukan ' . count($tokensData) . ' token, mulai kirim FCM...');

// ============================================
// Kirim FCM push ke setiap token terdaftar
// ============================================
$projectId = $serviceAccount['project_id'];
$fcmUrl = 'https://fcm.googleapis.com/v1/projects/' . $projectId . '/messages:send';

$sent = 0;
$failed = 0;

foreach($tokensData as $uid => $token){
    if(!$token) continue;

    $payload = [
        'message' => [
            'token' => $token,
            'notification' => [
                'title' => 'LWC100 - ' . $deviceId,
                'body'  => $message
            ]
        ]
    ];

    $ch = curl_init($fcmUrl);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($payload));
    curl_setopt($ch, CURLOPT_HTTPHEADER, [
        'Content-Type: application/json',
        'Authorization: Bearer ' . $accessToken
    ]);

    $result = curl_exec($ch);
    $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    curl_close($ch);

    debugLog($logFile, 'Kirim FCM ke uid=' . $uid . ' - HTTP ' . $httpCode . ' - response: ' . $result);

    if($httpCode === 200) $sent++;
    else $failed++;
}

echo json_encode(['sent' => $sent, 'failed' => $failed]);