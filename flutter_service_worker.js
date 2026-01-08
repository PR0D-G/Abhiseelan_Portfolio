'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "1518843d3d7d55270b08266898343e8f",
"assets/AssetManifest.bin.json": "0af0eb4eda7867566289f344eb528a73",
"assets/AssetManifest.json": "c2926566c3e18876e9463ca26bbb6292",
"assets/assets/certificates/breakout.png": "487ba2f5d5eff2ad0fb52649bc2e6e28",
"assets/assets/certificates/dart%2520udamey.png": "56c8a2f7abf85853b13fbff3647c781d",
"assets/assets/certificates/desktop.ini": "b70e31516cfc49c8c4c092087461955b",
"assets/assets/certificates/Great%2520learning%2520java.png": "eff941c55e9533772e019f8d1b7ee627",
"assets/assets/certificates/GuviCertification%2520-%2520Python.png": "d2e4532b33d68e91d2b37f49ded8517e",
"assets/assets/certificates/GuviCertification%2520Excel%2520mastering%2520mongodb%2520-.png": "b0842215663043fe0033c102ad49551e",
"assets/assets/certificates/Hackathon.jpeg": "153029d13c5839950d539dfb3537b62c",
"assets/assets/certificates/Introduction%2520to%2520cybersecurity%2520cisco.jpeg": "5d9141d235449105dea6c7f4914ee82d",
"assets/assets/certificates/Introduction%2520to%2520IoT%2520and%2520Digital%2520Cisco.png": "d68cdb1a1f6d9af5139c8a2f27ce77e1",
"assets/assets/certificates/lutter%2520udamey.png": "871a3b94fc19838d3377cbbf3215b090",
"assets/assets/certificates/Mongodb%2520java%2520developer%2520path.png": "030f7b4d2b2feb6aa4f9aae2e1ee1ef1",
"assets/assets/certificates/rest%2520APi%2520hacker%2520rank.png": "482e9921bc3a9fae7206b58574928eb0",
"assets/assets/images/analytics.svg": "d80f355e1a7bcb447f31237faf1ded30",
"assets/assets/images/android-svgrepo-com.svg": "f616d6cba8222526a337473bf056376a",
"assets/assets/images/api_logo.png": "ce0b5923f1c86cdec05517c3a656a490",
"assets/assets/images/code1.jpg": "0fde0e15b14c307031253b4d917e5107",
"assets/assets/images/figma.png": "ec6d1bddc09b18f51ed33babcb72d14a",
"assets/assets/images/firebase_logo.png": "8056769ef520a6e2db63960a8a99433e",
"assets/assets/images/flutter_logo.png": "4262c71228b7aa391e995fe5f1d57795",
"assets/assets/images/header.jpg": "c99c7bfaeda858a75048236e2cb8fac3",
"assets/assets/images/java_logo.png": "74e943d82452f81f6a0bb0b51ac6785d",
"assets/assets/images/man.png": "c22748ab398a23dc72be2144eb29a7ca",
"assets/assets/images/mongodb_logo.png": "529e82c7f69c219af6a3f51883083eef",
"assets/assets/images/pencil-case.svg": "0f1c447697b8be58e054b61fba5f49fa",
"assets/assets/images/postman_logo.png": "19a6fb9f3d456bb9fcab2ed7f8e243cb",
"assets/assets/images/prod.png": "b133ed118486538adb576f7fc33ed95f",
"assets/assets/images/profile.jpg": "74bf4058866c13cba4062c330458f6a4",
"assets/assets/images/responsive.svg": "8f4478a28a56dd1359636ac24af737f2",
"assets/assets/images/review.jpeg": "5f5d8ecc275a90fc33cea7be1c650f4e",
"assets/assets/images/scooter.svg": "60e7da1cd33d368f489d36900d7af77f",
"assets/assets/images/shipped.svg": "38eab17cdae407acd16c2f7482775cdd",
"assets/assets/images/sign%2520language.jpg": "332552dd9f83f3320368df7e1628a8fa",
"assets/assets/images/startup.svg": "f5308f21003552f209df1d3ef266debe",
"assets/assets/images/supabase_logo.png": "0f5eff2b13424820c08c045e2703d240",
"assets/assets/images/toolbox.svg": "6b504b4e84c19eca23ce272865dc8e97",
"assets/assets/images/xml_logo.png": "52f6c842783b0b405b91b83fe58ad566",
"assets/assets/project_preview/beyond_barriers.png": "9f2759cee3a8ad9915fd4233e2489bb6",
"assets/assets/project_preview/meta_dex.png": "6953de196025bbd14943738c07dd4de6",
"assets/assets/project_preview/path_x.png": "8b8d8e891af4f39ec70737fbb6380682",
"assets/assets/project_preview/sign_X.png": "6b7acdf9fa6dcfbc9eb1c5ef922fe113",
"assets/assets/project_preview/streak_mate.png": "fefe2b9ec3eecdd7155a22c2020a40b8",
"assets/assets/resume.pdf": "beffb7772a673864086b3a3289dede9b",
"assets/FontManifest.json": "07da357f1f636a449900bde6f7de338a",
"assets/fonts/MaterialIcons-Regular.otf": "fa6370a3173020b3fd6edf70d5e46d73",
"assets/NOTICES": "6a183f8872ba40c5f0e9914a9b78888b",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/font_awesome_flutter/lib/fonts/Font-Awesome-7-Brands-Regular-400.otf": "ab61f3fd261c47ede2396786657fad7f",
"assets/packages/font_awesome_flutter/lib/fonts/Font-Awesome-7-Free-Regular-400.otf": "f54c9f76734f74da2adc53655fbf92aa",
"assets/packages/font_awesome_flutter/lib/fonts/Font-Awesome-7-Free-Solid-900.otf": "d0af177ab4f261e9db5593b469bf2781",
"assets/packages/syncfusion_flutter_pdfviewer/assets/fonts/RobotoMono-Regular.ttf": "5b04fdfec4c8c36e8ca574e40b7148bb",
"assets/packages/syncfusion_flutter_pdfviewer/assets/icons/dark/highlight.png": "2aecc31aaa39ad43c978f209962a985c",
"assets/packages/syncfusion_flutter_pdfviewer/assets/icons/dark/squiggly.png": "68960bf4e16479abb83841e54e1ae6f4",
"assets/packages/syncfusion_flutter_pdfviewer/assets/icons/dark/strikethrough.png": "72e2d23b4cdd8a9e5e9cadadf0f05a3f",
"assets/packages/syncfusion_flutter_pdfviewer/assets/icons/dark/underline.png": "59886133294dd6587b0beeac054b2ca3",
"assets/packages/syncfusion_flutter_pdfviewer/assets/icons/light/highlight.png": "2fbda47037f7c99871891ca5e57e030b",
"assets/packages/syncfusion_flutter_pdfviewer/assets/icons/light/squiggly.png": "9894ce549037670d25d2c786036b810b",
"assets/packages/syncfusion_flutter_pdfviewer/assets/icons/light/strikethrough.png": "26f6729eee851adb4b598e3470e73983",
"assets/packages/syncfusion_flutter_pdfviewer/assets/icons/light/underline.png": "a98ff6a28215341f764f96d627a5d0f5",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "140ccb7d34d0a55065fbd422b843add6",
"canvaskit/canvaskit.js.symbols": "58832fbed59e00d2190aa295c4d70360",
"canvaskit/canvaskit.wasm": "07b9f5853202304d3b0749d9306573cc",
"canvaskit/chromium/canvaskit.js": "5e27aae346eee469027c80af0751d53d",
"canvaskit/chromium/canvaskit.js.symbols": "193deaca1a1424049326d4a91ad1d88d",
"canvaskit/chromium/canvaskit.wasm": "24c77e750a7fa6d474198905249ff506",
"canvaskit/skwasm.js": "1ef3ea3a0fec4569e5d531da25f34095",
"canvaskit/skwasm.js.symbols": "0088242d10d7e7d6d2649d1fe1bda7c1",
"canvaskit/skwasm.wasm": "264db41426307cfc7fa44b95a7772109",
"canvaskit/skwasm_heavy.js": "413f5b2b2d9345f37de148e2544f584f",
"canvaskit/skwasm_heavy.js.symbols": "3c01ec03b5de6d62c34e17014d1decd3",
"canvaskit/skwasm_heavy.wasm": "8034ad26ba2485dab2fd49bdd786837b",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "888483df48293866f9f41d3d9274a779",
"flutter_bootstrap.js": "2cbd91f975143e1641374a7d779123d3",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "c1d474e448fdc6523f19859b9cc467dc",
"/": "c1d474e448fdc6523f19859b9cc467dc",
"main.dart.js": "e79cd4a36987446a55d7bc7598a72958",
"manifest.json": "e74af8957b5899dc6da961caee768ec9",
"version.json": "009c9e65172e010890f7f65fde438006"};
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
