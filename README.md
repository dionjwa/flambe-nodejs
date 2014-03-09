flambe-nodejs
=============

The Flambe game engine running on headless server or rendering to PNGs.

Why on earth would you do this?  Flambe is a game *client* engine, right?

Here are a few reasons:

* You want to migrate or also run some client code (e.g. a game simulation) on your backend server.
* Functional testing: test clients via scripts without the need for complicated client containers such as Flash or a browser.
* Create many headless clients for testing an online game or load testing.
* Quicker development time when you are testing only a single frame (build, then check the png image).
* You want to generate a movie using your game engine.  You can use the png images for whatever purpose you want.


To install and run the demo:

	git clone --recursive https://github.com/dionjwa/flambe-nodejs
	cd flambe-nodejs
	npm install canvas
	npm install source-map-support
	npm install websocket
	haxe build.hxml
	node haxe.js

You will see some images created in the terminal.  These images are the result of different rendering operations.

If everything worked you'll have a 'frames' folder in the current directory with some of the frames rendered.  The control over what to render is in src/flambe/demo/NodeRendering.hx

You can also view the canvas in a web browser, and send mouse events.

	haxe -D node_flambe_server_enabled -D build.hxml
	node haxe.js

Then open a browser to http://localhost:7000

The canvas element detects mouse events and sends them back to the node client process.
