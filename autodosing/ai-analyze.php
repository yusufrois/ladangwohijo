<?php
// ai-analyze.php
// Jembatan aman antara web LWC100 dan Google Gemini API (GRATIS, 1500
// request/hari, tanpa kartu kredit). API key disimpan DI SINI (server),
// TIDAK PERNAH terlihat dari browser.

header('Content-Type: application/json');
header('Access-Control-Allow-Origin: https://ladangwohijo.com');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Content-Type');

if($_SERVER['REQUEST_METHOD'] === 'OPTIONS'){
    exit; // preflight CORS
}

// ============================================
// GANTI baris di bawah ini dengan API key Anda dari ai.google.dev
// ============================================
$apiKey = 'AQ.Ab8RN6JpBb5Crl8Y1rjQXaqlHj5UZR9sSeOCVP4IyL2jZiHcxA';

if($apiKey === 'GANTI_DENGAN_API_KEY_ANDA'){
    http_response_code(500);
    echo json_encode(['error' => 'API key belum diisi di ai-analyze.php']);
    exit;
}

$input = json_decode(file_get_contents('php://input'), true);

if(!$input || !isset($input['prompt']) || trim($input['prompt']) === ''){
    http_response_code(400);
    echo json_encode(['error' => 'Data tidak lengkap']);
    exit;
}

// Batasi panjang prompt supaya tidak disalahgunakan untuk hal di luar tujuan.
$userPrompt = substr($input['prompt'], 0, 4000);

$payload = [
    'contents' => [
        ['parts' => [['text' => $userPrompt]]]
    ]
];

$url = 'https://generativelanguage.googleapis.com/v1beta/models/gemini-3.6-flash:generateContent?key=' . urlencode($apiKey);

$ch = curl_init($url);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_POST, true);
curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($payload));
curl_setopt($ch, CURLOPT_HTTPHEADER, ['Content-Type: application/json']);
curl_setopt($ch, CURLOPT_TIMEOUT, 30);

$response = curl_exec($ch);
$httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
$curlErr = curl_error($ch);
curl_close($ch);

if($curlErr){
    http_response_code(500);
    echo json_encode(['error' => 'Gagal hubungi AI: ' . $curlErr]);
    exit;
}

if($httpCode !== 200){
    http_response_code($httpCode);
    echo json_encode(['error' => 'AI merespon error', 'detail' => json_decode($response, true)]);
    exit;
}

$data = json_decode($response, true);
$text = isset($data['candidates'][0]['content']['parts'][0]['text'])
    ? $data['candidates'][0]['content']['parts'][0]['text']
    : 'Tidak ada respon dari AI';

echo json_encode(['text' => $text]);
