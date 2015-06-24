package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.graphics.frames.FlxBitmapFont;
import flixel.math.FlxPoint;
import flixel.text.FlxBitmapText;
using flixel.util.FlxSpriteUtil;

class PlayState extends FlxState
{
	override public function create():Void
	{
		bgColor = 0;
		super.create();
		
		var text = new FlxBitmapText(
			FlxBitmapFont.fromMonospace(AssetPaths.tiny_font__png,
			FlxBitmapFont.DEFAULT_CHARS, FlxPoint.get( 8, 8)));
		text.text = "Hello, World!";
		text.scale.set(2, 2);
		text.screenCenter();
		add(text);
	}
}
