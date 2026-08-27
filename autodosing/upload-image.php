<?php
// upload-image.php
// Terima upload gambar (foto hasil panen) dan simpan ke folder img/ di
// hosting ini. Cuma kembalikan URL-nya - gambar TIDAK disimpan di Firebase
// (Realtime Database tidak cocok untuk file besar).

header('Content-Type: application/json');

if($_SERVER['REQUEST_METHOD'] === 'OPTIONS'){
    exit;
}

// ============================================
// WAJIB: verifikasi pemanggil ini user yang sudah login - supaya endpoint
// ini tidak jadi "upload file terbuka" buat siapa saja di internet.
// Pola sama seperti delete-user.php.
// ============================================
$serviceAccountPath = __DIR__ . '/../../service-account.json';

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

function getGoogleAccessToken($serviceAccount, $scope){
    $header = ['alg' => 'RS256', 'typ' => 'JWT'];
    $now = time();
    $claims = [
        'iss'   => $serviceAccount['client_email'],
        'scope' => $scope,
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

$callerIdToken = isset($_POST['callerIdToken']) ? $_POST['callerIdToken'] : '';

if(!$callerIdToken){
    http_response_code(400);
    echo json_encode(['error' => 'Token pemanggil tidak ada']);
    exit;
}

$accessToken = getGoogleAccessToken($serviceAccount, 'https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/identitytoolkit https://www.googleapis.com/auth/firebase.database');

if(!$accessToken){
    http_response_code(500);
    echo json_encode(['error' => 'Gagal dapat access token dari Google']);
    exit;
}

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

$lookupData = json_decode($lookupResult, true);
$callerUid = ($lookupCode === 200 && isset($lookupData['users'][0]['localId'])) ? $lookupData['users'][0]['localId'] : null;

if(!$callerUid){
    http_response_code(401);
    echo json_encode(['error' => 'Token pemanggil tidak valid - silakan login ulang']);
    exit;
}

// ============================================
// WAJIB: pastikan pemanggil ini punya AKSES ke device yang dituju - bukan
// cuma "sudah login" (siapa pun yang punya akun bisa login, tapi belum
// tentu punya akses ke device tertentu). Cek via deviceOwners, sama
// seperti aturan Firebase rules yang sudah ada.
// ============================================
$deviceId = isset($_POST['deviceId']) ? $_POST['deviceId'] : '';

if(!$deviceId){
    http_response_code(400);
    echo json_encode(['error' => 'Device ID tidak ada']);
    exit;
}

$databaseUrl = 'https://ladangwohijo-2cdfb-default-rtdb.asia-southeast1.firebasedatabase.app';
$ownerCheckUrl = $databaseUrl . '/deviceOwners/' . urlencode($deviceId) . '/' . urlencode($callerUid) . '.json';

$ch = curl_init($ownerCheckUrl);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_HTTPHEADER, ['Authorization: Bearer ' . $accessToken]);
$ownerCheckResult = curl_exec($ch);
$ownerCheckCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
curl_close($ch);

$logFile = __DIR__ . '/upload_image_debug.log';
file_put_contents($logFile, date('Y-m-d H:i:s') .
    ' - deviceId=' . $deviceId .
    ' callerUid=' . $callerUid .
    ' checkUrl=' . $ownerCheckUrl .
    ' httpCode=' . $ownerCheckCode .
    ' response=' . $ownerCheckResult . "\n", FILE_APPEND);

if(json_decode($ownerCheckResult, true) !== true){
    http_response_code(403);
    echo json_encode(['error' => 'Anda tidak punya akses ke device ini']);
    exit;
}

// ============================================
// Validasi file yang diupload
// ============================================
if(!isset($_FILES['image']) || $_FILES['image']['error'] !== UPLOAD_ERR_OK){
    http_response_code(400);
    echo json_encode(['error' => 'Tidak ada file gambar yang terkirim']);
    exit;
}

$file = $_FILES['image'];

// Batas ukuran 5MB - cukup untuk foto HP biasa, cegah upload file raksasa
// yang bisa penuhi hosting.
$maxSize = 5 * 1024 * 1024;
if($file['size'] > $maxSize){
    http_response_code(400);
    echo json_encode(['error' => 'Ukuran gambar maksimal 5MB']);
    exit;
}

// Cek tipe file SUNGGUHAN (bukan cuma percaya nama file/ekstensi dari
// browser, itu bisa dipalsukan) - pakai getimagesize() yang benar-benar
// baca isi file gambarnya.
$imageInfo = @getimagesize($file['tmp_name']);
if($imageInfo === false){
    http_response_code(400);
    echo json_encode(['error' => 'File yang diupload bukan gambar yang valid']);
    exit;
}

$allowedTypes = [
    IMAGETYPE_JPEG => 'jpg',
    IMAGETYPE_PNG  => 'png',
    IMAGETYPE_WEBP => 'webp',
    IMAGETYPE_GIF  => 'gif'
];

if(!isset($allowedTypes[$imageInfo[2]])){
    http_response_code(400);
    echo json_encode(['error' => 'Format gambar harus JPG, PNG, WEBP, atau GIF']);
    exit;
}

$ext = $allowedTypes[$imageInfo[2]];

// Nama file ACAK - JANGAN pernah pakai nama asli dari user (bisa berisi
// karakter berbahaya, atau sengaja ditabrakkan dengan file lain).
$safeFilename = bin2hex(random_bytes(16)) . '.' . $ext;

$imgDir = __DIR__ . '/img';
if(!is_dir($imgDir)){
    mkdir($imgDir, 0755, true);
}

$destPath = $imgDir . '/' . $safeFilename;

if(!move_uploaded_file($file['tmp_name'], $destPath)){
    http_response_code(500);
    echo json_encode(['error' => 'Gagal simpan file ke server']);
    exit;
}

// Bangun URL lengkap ke file-nya
$protocol = (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off') ? 'https' : 'http';
$host = $_SERVER['HTTP_HOST'];
$dir = rtrim(str_replace('\\', '/', dirname($_SERVER['SCRIPT_NAME'])), '/');
$url = $protocol . '://' . $host . $dir . '/img/' . $safeFilename;

echo json_encode(['success' => true, 'url' => $url]);