package;

import flixel.FlxG;
import flixel.FlxGame;
import openfl.display.Sprite;

class Main extends Sprite
{
	public function new()
	{
		super();
		addChild(new FlxGame(725, 85, PlayState, 60, 60, true, false));
		FlxG.autoPause = false;
	}
}
