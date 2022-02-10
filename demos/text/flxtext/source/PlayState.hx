package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	override public function create()
	{
		bgColor = 0;

super.create();

		var text = new FlxText();
		text.text = "Hello, World!";
		text.color = FlxColor.CYAN;
		text.size = 32;
		text.setBorderStyle(FlxTextBorderStyle.SHADOW, FlxColor.BLUE, 4);
		text.screenCenter();
		add(text);
	}
}
