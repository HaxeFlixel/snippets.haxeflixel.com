package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.graphics.frames.FlxBitmapFont;
import flixel.math.FlxPoint;
import flixel.text.FlxBitmapText;

class PlayState extends FlxState
{
	override public function create()
	{
		bgColor = 0;

super.create();

		var text = new FlxBitmapText(FlxBitmapFont.fromMonospace("assets/tiny-font.png",
			FlxBitmapFont.DEFAULT_CHARS, FlxPoint.get(8, 8)));
		text.text = "Hello, World!";
		text.scale.set(2, 2);
		text.screenCenter();
		add(text);
	}
}
