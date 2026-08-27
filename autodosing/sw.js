// LWC100 Service Worker
//
// PENTING: bagian cache di bawah ini HANYA untuk "kerangka aplikasi" (file
// HTML/ikon itu sendiri) - SAMA SEKALI TIDAK menyimpan data Firebase
// (sensor, relay, jadwal, dll). Data sensor/kontrol harus SELALU real-time
// langsung dari Firebase, tidak boleh ada versi "basi" tersimpan - ini alat
// kontrol dosing kimia, data yang salah bisa berbahaya.

importScripts('https://www.gstatic.com/firebasejs/9.22.2/firebase-app-compat.js');
importScripts('https://www.gstatic.com/firebasejs/9.22.2/firebase-messaging-compat.js');

firebase.initializeApp({
  apiKey: "AIzaSyBun5M40MTfOS_t4PMIeyNuahlzgs08Q_M",
  databaseURL: "https://ladangwohijo-2cdfb-default-rtdb.asia-southeast1.firebasedatabase.app",
  projectId: "ladangwohijo-2cdfb",
  messagingSenderId: "446990260127",
  appId: "1:446990260127:web:77552fba522f9751788faa"
});

var messaging = firebase.messaging();

messaging.onBackgroundMessage(function(payload) {
  var title = (payload.notification && payload.notification.title) || 'LWC100';
  var body  = (payload.notification && payload.notification.body)  || '';

  self.registration.showNotification(title, {
    body: body,
    icon: 'icon-192.png',
    badge: 'icon-192.png'
  });
});

const CACHE_NAME = 'lwc100-shell-v2';

const SHELL_FILES = [
  './index.html',
  './style.css',
  './manifest.json',
  './icon-192.png',
  './icon-512.png'
];

self.addEventListener('install', function(event) {
  event.waitUntil(
    caches.open(CACHE_NAME).then(function(cache) {
      return cache.addAll(SHELL_FILES);
    })
  );
  self.skipWaiting();
});

self.addEventListener('activate', function(event) {
  event.waitUntil(
    caches.keys().then(function(names) {
      return Promise.all(
        names.filter(function(n) { return n !== CACHE_NAME; })
             .map(function(n) { return caches.delete(n); })
      );
    })
  );
  self.clients.claim();
});

self.addEventListener('fetch', function(event) {
  var url = event.request.url;

  // JANGAN PERNAH cache apa pun yang menuju Firebase (data real-time) atau
  // library eksternal (Tailwind/Chart.js/XLSX/dll) - itu harus selalu live,
  // langsung ke jaringan, tidak lewat service worker ini sama sekali.
  if(url.indexOf('firebaseio.com') >= 0 ||
     url.indexOf('firebasedatabase.app') >= 0 ||
     url.indexOf('googleapis.com') >= 0 ||
     url.indexOf('gstatic.com') >= 0 ||
     url.indexOf('cdn.') >= 0){
    return; // biarkan browser tangani langsung, tidak diintersep
  }

  // Untuk file kerangka aplikasi sendiri: coba jaringan dulu (supaya selalu
  // dapat update terbaru saat online), baru fallback ke cache kalau
  // benar-benar offline (misal buka app pas tidak ada sinyal sama sekali).
  event.respondWith(
    fetch(event.request)
      .then(function(response) {
        var copy = response.clone();
        caches.open(CACHE_NAME).then(function(cache) {
          cache.put(event.request, copy);
        });
        return response;
      })
      .catch(function() {
        return caches.match(event.request);
      })
  );
});