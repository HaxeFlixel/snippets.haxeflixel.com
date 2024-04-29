package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	override function create()
	{
		super.create();
		
		var text = new FlxText();
		text.text = "Hello, World!";
		text.font = "assets/Arial Rounded Bold.ttf";
		text.color = FlxColor.BLACK;
		text.size = 32;
		text.screenCenter();
		add(text);
	}
}
