package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;

class PlayState extends FlxState
{
	private var text:FlxText;
	
	override public function create():Void
	{
		bgColor = 0;
		super.create();

		text = new FlxText();
		text.text = 'FlxText';
		text.x = FlxG.width / 2 - text.width / 2;
		text.y = FlxG.height / 2 - text.height / 2;
		add(text);
	}
}