importScripts("https://www.gstatic.com/firebasejs/9.6.10/firebase-app-compat.js");
importScripts("https://www.gstatic.com/firebasejs/9.6.10/firebase-messaging-compat.js");

firebase.initializeApp({
  apiKey: "AIzaSyBoUvMLIHQAhtvkvb8Dthpm5b0gOq7hiSs",
  authDomain: "temperature-cca1c.firebaseapp.com",
  projectId: "temperature-cca1c",
  messagingSenderId: "344590623575",
  appId: "1:344590623575:web:bcd983c83bc3b528e75412"
});

const messaging = firebase.messaging();

messaging.onBackgroundMessage(payload => {
  console.log("[firebase-messaging-sw.js] Pesan background:", payload);
  const { title, body, icon } = payload.notification;
  self.registration.showNotification(title, { body, icon });
});
