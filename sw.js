var C='dsb-v15',F=['./','index.html','manifest.json','icon-192.png','icon-512.png'];
self.addEventListener('install',function(e){e.waitUntil(caches.open(C).then(function(c){return c.addAll(F)}));self.skipWaiting()});
self.addEventListener('activate',function(e){e.waitUntil(caches.keys().then(function(k){return Promise.all(k.filter(function(x){return x!==C}).map(function(x){return caches.delete(x)}))}).then(function(){return clients.claim()}))});
self.addEventListener('fetch',function(e){var u=new URL(e.request.url);if(e.request.method!=='GET'||(u.origin!==location.origin&&u.hostname!=='cdn.jsdelivr.net'))return;e.respondWith(fetch(e.request).then(function(x){var c=x.clone();caches.open(C).then(function(k){k.put(e.request,c)});return x}).catch(function(){return caches.match(e.request)}))});
self.addEventListener('notificationclick',function(e){e.notification.close();e.waitUntil(clients.openWindow('./index.html'))});
