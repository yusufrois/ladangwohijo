<?php

$domain = "https://www.ladangwohijo.com";
$dir = "./";

// File yang TIDAK boleh masuk sitemap (tool internal, verifikasi Google, dsb)
$exclude = [
    "print.html",
    "signature.html",
    "google821b2f6075f47a2d.html",
    "googlee7a02ef8fc62b0bf.html",
];

$files = glob($dir . "*.html");

$xml = '<?xml version="1.0" encoding="UTF-8"?>' . "\n";
$xml .= '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">' . "\n";

foreach ($files as $file) {
    $url = str_replace("./", "", $file);

    if (in_array($url, $exclude)) {
        continue;
    }

    $lastmod = date("Y-m-d", filemtime($file));

    // index.html selalu jadi homepage "/"
    $loc = ($url === "index.html") ? "$domain/" : "$domain/$url";
    $priority = ($url === "index.html") ? "1.0" : "0.7";

    $xml .= "  <url>\n";
    $xml .= "    <loc>$loc</loc>\n";
    $xml .= "    <lastmod>$lastmod</lastmod>\n";
    $xml .= "    <changefreq>weekly</changefreq>\n";
    $xml .= "    <priority>$priority</priority>\n";
    $xml .= "  </url>\n";
}

$xml .= '</urlset>' . "\n";

file_put_contents("sitemap.xml", $xml);

echo "Sitemap berhasil dibuat!";
