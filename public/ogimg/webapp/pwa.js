

//This is the service worker with the Cache-first network
var PWA_CONF = {
	logging : 1,
	version: "34.0.7",
	files : [
		"iconslayer.min.css",
		"iconslayer.min.js"
	]
}

var MESSAGES = {
	install 	: 'The service worker is being installed.',
	installSkip : '[ServiceWorker] Skip waiting on install',
	activate 	: '[ServiceWorker] Claiming clients for current page',
	fromCache 	: 'The service worker is providing the asset.',
	fromServer 	: 'Cache failed, network asset request.',
}

var CACHE_NAME = PWA_CONF.name + "-v-" + (PWA_CONF.version);

function log(){
	if(PWA_CONF.logging){
		console.log.call(this, arguments);
	}
}

//Install stage sets up the cache-array to configure pre-cache content
self.addEventListener('install', function(evt) {
	log(MESSAGES.install);
	evt.waitUntil(precache().then(function() {
		log(MESSAGES.installSkip);
		return self.skipWaiting();

	}));
});


//allow sw to control of current page
self.addEventListener('activate', function(event) {
	log(MESSAGES.activate);
	return self.clients.claim();

});

self.addEventListener('fetch', function(evt) {
	evt.respondWith(fromCache(evt.request).catch(fromServer(evt.request)));
	evt.waitUntil(update(evt.request));
});


function precache() {
	return caches.open(CACHE_NAME).then(function(cache) {
		return cache.addAll(PWA_CONF.files);
	});
}


function fromCache(request) {
	//we pull files from the cache first thing so we can show them fast

	log(MESSAGES.fromCache + evt.request.url);
	return caches.open(CACHE).then(function(cache) {
		return cache.match(request).then(function(matching) {
			return matching || Promise.reject('no-match');
		});
	});
}


function update(request) {
	//this is where we call the server to get the newest version of the 
	//file to use the next time we show view
	return caches.open(CACHE).then(function(cache) {
		return fetch(request).then(function(response) {
			return cache.put(request, response);
		});
	});
}

function fromServer(request) {
	log(MESSAGES.fromServer + evt.request.url);
	//this is the fallback if it is not in the cahche to go to the server and get it
	return fetch(request).then(function(response) { return response })
}

