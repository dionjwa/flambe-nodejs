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


To install:

git clone --recursive https://github.com/dionjwa/flambe-nodejs
