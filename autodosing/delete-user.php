<?php
// delete-user.php
// Hapus akun Firebase Auth SEPENUHNYA (bukan cuma cabut akses device).
// Dipanggil dari panel Admin di web. Pakai service-account.json yang sama
// seperti notify.php (di luar folder publik, lihat catatan di sana).

header('Content-Type: application/json');

if($_SERVER['REQUEST_METHOD'] === 'OPTIONS'){
    exit;
}

$serviceAccountPath = __DIR__ . '/../../service-account.json';

$input = json_decode(file_get_contents('php://input'), true);

if(!$input || !isset($input['uid']) || trim($input['uid']) === '' || !isset($input['callerIdToken'])){
    http_response_code(400);
    echo json_encode(['error' => 'Data tidak lengkap']);
    exit;
}

$targetUid = $input['uid'];
$callerIdToken = $input['callerIdToken'];

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

function base64url_encode($data){
    return rtrim(strtr(base64_encode($data), '+/', '-_'), '=');
}

function getGoogleAccessToken($serviceAccount){
    $header = ['alg' => 'RS256', 'typ' => 'JWT'];
    $now = time();
    $claims = [
        'iss'   => $serviceAccount['client_email'],
        'scope' => 'https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/identitytoolkit https://www.googleapis.com/auth/firebase.database',
        'aud'   => 'https://oauth2.googleapis.com/token',
        'exp'   => $now + 3600,
        'iat'   => $now
    ];

    $signingInput = base64url_encode(json_encode($header)) . '.' . base64url_encode(json_encode($claims));

    $signature = '';
    $ok = openssl_sign($signingInput, $signature, $serviceAccount['private_key'], 'SHA256');

    if(!$ok) return null;

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

$logFile = __DIR__ . '/delete_user_debug.log';
function debugLog($logFile, $msg){
    file_put_contents($logFile, date('Y-m-d H:i:s') . ' - ' . $msg . "\n", FILE_APPEND);
}

if(!$accessToken){
    debugLog($logFile, 'GAGAL dapat access token dari Google');
    http_response_code(500);
    echo json_encode(['error' => 'Gagal dapat access token dari Google']);
    exit;
}

// ============================================
// WAJIB: verifikasi pemanggil ini benar-benar admin, BUKAN sekadar
// percaya begitu saja dari sisi web - operasi ini destruktif (hapus akun
// orang lain), harus dicek ulang di server.
// ============================================
$ch = curl_init('https://identitytoolkit.googleapis.com/v1/accounts:lookup');
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_POST, true);
curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode(['idToken' => $callerIdToken]));
curl_setopt($ch, CURLOPT_HTTPHEADER, [
    'Content-Type: application/json',
    'Authorization: Bearer ' . $accessToken
]);
$lookupResult = curl_exec($ch);
$lookupCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
curl_close($ch);

debugLog($logFile, 'Lookup caller - HTTP ' . $lookupCode . ', response: ' . $lookupResult);

$lookupData = json_decode($lookupResult, true);
$callerUid = ($lookupCode === 200 && isset($lookupData['users'][0]['localId'])) ? $lookupData['users'][0]['localId'] : null;

if(!$callerUid){
    http_response_code(401);
    echo json_encode(['error' => 'Token pemanggil tidak valid']);
    exit;
}

$databaseUrl = 'https://ladangwohijo-2cdfb-default-rtdb.asia-southeast1.firebasedatabase.app';
$adminCheckUrl = $databaseUrl . '/admins/' . urlencode($callerUid) . '.json';

$ch = curl_init($adminCheckUrl);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_HTTPHEADER, ['Authorization: Bearer ' . $accessToken]);
$adminCheckResult = curl_exec($ch);
curl_close($ch);

debugLog($logFile, 'Cek admin untuk uid=' . $callerUid . ' - response: ' . $adminCheckResult);

if(json_decode($adminCheckResult, true) !== true){
    http_response_code(403);
    echo json_encode(['error' => 'Pemanggil bukan admin']);
    exit;
}

// ============================================
// Hapus akun via Identity Toolkit Admin API
// ============================================
$payload = [
    'localId'         => $targetUid,
    'targetProjectId' => $serviceAccount['project_id']
];

$ch = curl_init('https://identitytoolkit.googleapis.com/v1/accounts:delete');
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

if($httpCode !== 200){
    http_response_code($httpCode);
    echo json_encode(['error' => 'Gagal hapus akun', 'detail' => json_decode($result, true)]);
    exit;
}

echo json_encode(['success' => true]);