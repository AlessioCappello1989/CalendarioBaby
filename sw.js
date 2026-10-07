var C='dsb-v2',F=['./','index.html','manifest.json','icon-192.png','icon-512.png'];
self.addEventListener('install',function(e){e.waitUntil(caches.open(C).then(function(c){return c.addAll(F)}));self.skipWaiting()});
self.addEventListener('activate',function(e){e.waitUntil(clients.claim())});
self.addEventListener('fetch',function(e){e.respondWith(fetch(e.request).catch(function(){return caches.match(e.request)}))});
self.addEventListener('notificationclick',function(e){e.notification.close();e.waitUntil(clients.openWindow('./index.html'))});