// ============================
// === SERVICE WORKER (PWA) ===
// ============================

const CACHE_NAME = "wohijo-v3"; // ubah versi jika update
const urlsToCache = [
  "/",
  "/index.html",
  "/manifest.json",
  "/apple-touch-icon.png",
  "https://cdn.tailwindcss.com"
];

// Install dan cache
self.addEventListener("install", event => {
  console.log("[SW] Installing...");
  event.waitUntil(
    (async () => {
      const cache = await caches.open(CACHE_NAME);
      for (const url of urlsToCache) {
        try {
          const response = await fetch(url, { cache: "no-cache" });
          if (response.ok) await cache.put(url, response.clone());
        } catch (err) {
          console.warn("[SW] Gagal cache:", url, err.message);
        }
      }
    })()
  );
  self.skipWaiting();
});

// Fetch cache-first
self.addEventListener("fetch", event => {
  event.respondWith(
    caches.match(event.request).then(response => {
      if (response) return response;
      return fetch(event.request)
        .then(networkResponse => {
          if (
            event.request.method === "GET" &&
            !event.request.url.includes("firebaseio.com")
          ) {
            const clone = networkResponse.clone();
            caches.open(CACHE_NAME).then(cache => cache.put(event.request, clone));
          }
          return networkResponse;
        })
        .catch(() => caches.match("/index.html"));
    })
  );
});

// Hapus cache lama
self.addEventListener("activate", event => {
  console.log("[SW] Activating...");
  event.waitUntil(
    caches.keys().then(names =>
      Promise.all(names.filter(n => n !== CACHE_NAME).map(n => caches.delete(n)))
    )
  );
  self.clients.claim();
});


// ============================
// === FIREBASE MESSAGING ===
// ============================

// Import Firebase SDK (gunakan versi modular CDN)
importScripts("https://www.gstatic.com/firebasejs/10.14.1/firebase-app-compat.js");
importScripts("https://www.gstatic.com/firebasejs/10.14.1/firebase-messaging-compat.js");

// Konfigurasi Firebase
firebase.initializeApp({
  apiKey: "API_KEY_KAMU",
  authDomain: "PROJECT_ID.firebaseapp.com",
  projectId: "PROJECT_ID",
  storageBucket: "PROJECT_ID.appspot.com",
  messagingSenderId: "SENDER_ID",
  appId: "APP_ID"
});

// Inisialisasi messaging
const messaging = firebase.messaging();

// Tampilkan notifikasi jika ada pesan di background
messaging.onBackgroundMessage(payload => {
  console.log("[SW] Pesan background:", payload);
  const notificationTitle = payload.notification.title;
  const notificationOptions = {
    body: payload.notification.body,
    icon: "apple-touch-icon.png"
  };
  self.registration.showNotification(notificationTitle, notificationOptions);
});
