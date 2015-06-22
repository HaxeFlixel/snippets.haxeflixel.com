package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.graphics.frames.FlxBitmapFont;
import flixel.math.FlxPoint;
import flixel.text.FlxBitmapText;

class PlayState extends FlxState
{
	private var text:FlxBitmapText;
	override public function create():Void
	{
		bgColor = 0;
		super.create();
		
		text = new FlxBitmapText(FlxBitmapFont.fromMonospace(AssetPaths.tiny_font__png, FlxBitmapFont.DEFAULT_CHARS, FlxPoint.get( 8, 8)));
		text.text = "Hello, World!";
		text.scale.set(2, 2);
		text.x = FlxG.width / 2 - text.width / 2;
		text.y = FlxG.height / 2 - text.height / 2;
		add(text);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
