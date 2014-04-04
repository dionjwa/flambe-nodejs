package flambe.demo;

import haxe.rtti.Meta;
import haxe.Json;

import flambe.System;
import flambe.display.ImageSprite;
import flambe.display.TextSprite;
import flambe.display.Font;
import flambe.platform.ManifestBuilder;
import flambe.asset.AssetPack;
import flambe.asset.Manifest;

import flambe.platform.nodejs.NodePlatform;

class NodeRendering
{
	public static function main()
	{
		new NodeRendering();
	}

	function new()
	{
		try {
            var sourceMapSupport = js.Node.require('source-map-support');
            if (sourceMapSupport != null) {
                untyped sourceMapSupport.install();
                trace("Source mapping enabled");
            }
        } catch (e :Dynamic){trace("source mapping failed");}

		System.init();
		System.stage.requestResize(300, 300);
#if !node_flambe_server_enabled
		NodePlatform.instance.isCanvasRendererEnabled = true;
		NodePlatform.instance.isRenderingEveryFrame = true;
#end
		flambe.platform.ManifestBuilder.use('demo/assets');
		var promise = System.loadAssetPack(Manifest.fromAssets("bootstrap"));

		promise.success.connect(onAssetPackLoaded);
		promise.error.connect(function (err) {
			Log.error("Error loading assets: " + err);
		});
	}

	function onAssetPackLoaded(pack :AssetPack)
	{
		var foo = pack.getFile('foo.json');
		Log.info('foo=$foo');

		var texture = pack.getTexture('dolphin');
		var sprite = new ImageSprite(texture);
		System.root.addChild(new Entity().add(sprite));
		NodePlatform.instance.step();
		sprite.x._ = 3;
		NodePlatform.instance.step();
		sprite.x._ = 5;

		texture.graphics.fillRect(0xffff00, 10, 10, 30, 30);

		NodePlatform.instance.step();
		sprite.x._ = 7;

		var pixels = texture.readPixels(0, 0, 5, 5);

		texture.writePixels(pixels, 20, 20, 5, 5);

		NodePlatform.instance.step();
		sprite.x._ = 10;

		var patternTexture = System.renderer.createTexture(20, 20);
		patternTexture.graphics.fillRect(0xff0000, 0, 0, 3, 3);
		patternTexture.graphics.fillRect(0xffff00, 6, 6, 3, 4);

		texture.graphics.drawPattern(patternTexture, 0, 0, 300, 400);
		NodePlatform.instance.step();


		var font = new Font(pack, "FontAwesome");
		var myTextField = new TextSprite(font, "");
		System.root.addChild(new Entity().add(myTextField));
		NodePlatform.instance.step();
#if show_canvas_demo
		NodePlatform.instance.startMainLoop();
#end
		// NodePlatform.instance.step();
	}
}