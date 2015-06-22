package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class PlayState extends FlxState
{

	private var text:FlxText;
	override public function create():Void
	{
		bgColor = 0;
		super.create();
		
		text = new FlxText();
		text.text = "Hello, World!";
		text.color = FlxColor.CYAN;
		text.size = 32;
		text.alignment = FlxTextAlign.CENTER;
		text.setBorderStyle(FlxTextBorderStyle.SHADOW, FlxColor.BLUE, 4);
		text.x = FlxG.width / 2 - text.width / 2;
		text.y = FlxG.height / 2 - text.height / 2;
		add(text);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
