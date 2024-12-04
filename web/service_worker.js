self.addEventListener('install', (event) => {
    event.waitUntil(
      caches.open('flutter-app-cache').then((cache) => {
        return cache.addAll([
          // Archivos que quieres que estén en caché, puedes agregar más archivos según sea necesario
          '/',
          '/index.html',
          '/main.dart.js',
          'home.dart.js',
          '/assets/AssetManifest.json',
          '/assets/FontManifest.json',
          '/assets/packages/flutter_web_plugins/assets/packages/flutter_web_plugins/font/MaterialIcons-Regular.woff2',
          '/favicon.ico',
          // Puedes añadir más rutas de archivos estáticos si lo deseas
        ]);
      })
    );
  });
  
  self.addEventListener('fetch', (event) => {
    event.respondWith(
      caches.match(event.request).then((cachedResponse) => {
        // Si la respuesta está en el caché, la retorna, de lo contrario, hace la solicitud de red.
        return cachedResponse || fetch(event.request);
      })
    );
  });
  
  self.addEventListener('activate', (event) => {
    var cacheWhitelist = ['flutter-app-cache'];
    event.waitUntil(
      caches.keys().then((cacheNames) => {
        return Promise.all(
          cacheNames.map((cacheName) => {
            if (cacheWhitelist.indexOf(cacheName) === -1) {
              return caches.delete(cacheName);
            }
          })
        );
      })
    );
  });
  