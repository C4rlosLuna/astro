'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "8625eb9dfc35144464c564c17a5f1f83",
"assets/AssetManifest.bin.json": "c214d632a2364e41052e363dbc7cd956",
"assets/AssetManifest.json": "b9279e39c0c0af7d5fe786a27aa0f1ba",
"assets/assets/andromeda.gif": "69f8d1dacd2b9708df8696c10f0a2b01",
"assets/assets/astro1.gif": "b0d2cbc1a1e0613928e2943958c7c882",
"assets/assets/astro1.png": "1a135c15156c8c066a06c52afb9430a5",
"assets/assets/astro2.gif": "e114207dadef55d435172bb5683b919e",
"assets/assets/astro2.png": "39222e01bb1aac3f885fe28b324a297b",
"assets/assets/astro3.png": "c3501d55b490f3199670227eaf87bc37",
"assets/assets/astro4.png": "cc9e7fca0b81f2f80cff9dfd3515c095",
"assets/assets/AstroAdmin.png": "4d2724fb2a9327bbffb6b8ddee80e049",
"assets/assets/AstroAnimacion.gif": "9cc90b7f5edce1540f61ea99924f4798",
"assets/assets/AstroBeats.gif": "b8037af9d6d4e1c0c67e4b33f1bcac91",
"assets/assets/astronauta.gif": "0199eac62ea575b7dd6cebd73ee349a7",
"assets/assets/AstroPaquetes.gif": "5b073f700c35cac76bb4805d3af80f6b",
"assets/assets/ConoceA.png": "42baa9695dd06a5dc491c9c578421262",
"assets/assets/ConoceAstro.png": "1163f34482b7bee109f9417a3f4c8461",
"assets/assets/destiny.jpg": "68f0dbf3da495bf612ffb01822b1639b",
"assets/assets/fondo.jpg": "f6ee91078cf1cd6f0164013ce7625027",
"assets/assets/fonts/Pacifico-Regular.ttf": "85bb2d0ec4a0da159de42e89089ccc0b",
"assets/assets/fonts/Ubuntu-Regular.ttf": "84ea7c5c9d2fa40c070ccb901046117d",
"assets/assets/logocompleto.png": "5397e64aff99120f1258b55baa037f01",
"assets/assets/logotipografico.png": "825245e7c0e5e047a90f556862b1bfdb",
"assets/assets/lumamoma.png": "4301e01d0174b6e02779bb1f5982082d",
"assets/assets/meteoro.gif": "9acf349c81a2fd88bd184e872499565a",
"assets/assets/modelados/astro.glb": "4620a10c6c715df69e16a7220e095625",
"assets/assets/modelados/astro.obj": "ef10ed65c387704779324f151672ae0d",
"assets/assets/nova.gif": "1dc0c2815963b09348082123a385e293",
"assets/assets/orion.gif": "ca41a32a667a03d6aa427e71a622683a",
"assets/assets/pdf/Aspectoslegales.pdf": "a97eb73f1d56a047c37edf48beaed4f4",
"assets/assets/pdf/Derechos_Autor_PWA.pdf": "aaea0541eb6ee658f665db6ff5b7d199",
"assets/assets/pdf/Pol%25C3%25ADtica.docx.pdf": "c0b3159e85872fafff642e1d09397ed0",
"assets/assets/pdf/QuejaCliente.pdf": "35c2c1d56cffbf7b579084164638657a",
"assets/assets/principal.gif": "c7fa8de80ccd17ec75c8e8766591ec8d",
"assets/FontManifest.json": "8cd76d88f49bd873182b398cd1730039",
"assets/fonts/MaterialIcons-Regular.otf": "f86c16422c00bbd87a3c9e0a77f356e5",
"assets/NOTICES": "4804201a500586a5f6a55db3c07e9904",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/packages/model_viewer_plus/assets/model-viewer.min.js": "a9dc98f8bf360be897a0898a7395f905",
"assets/packages/model_viewer_plus/assets/template.html": "8de94ff19fee64be3edffddb412ab63c",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"favicon.png": "1c4106f738747fa5af7fea31071f274d",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"flutter_bootstrap.js": "235453117d67eff638da04baf0a58f2f",
"icons/Icon-144.png": "3decec90923fdb43e342f35ee66feb1b",
"icons/Icon-192.png": "95c5e832a6e5c642d99242926f7853f4",
"icons/Icon-512.png": "a5d49ed9c79ebe1889b403a7596e96b7",
"icons/Icon-maskable-144.png": "3decec90923fdb43e342f35ee66feb1b",
"icons/Icon-maskable-192.png": "31c07edc6cf74c25910ee397116ffd3f",
"icons/Icon-maskable-512.png": "6cec8e11fcacd428fa2af8430cf537b0",
"index.html": "5180455a830ce50ad7e49da63533e079",
"/": "5180455a830ce50ad7e49da63533e079",
"main.dart.js": "17d3481bf16cc10ce53a4c3a26ec42fc",
"manifest.json": "1160e4b3e7a031e3cf7305347bbe512b",
"service_worker.js": "9cab702ed3ab74ebd1b575a5f76b3ab2",
"version.json": "34b6ae6c50bb49b65d7a071e533a9ca0"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
