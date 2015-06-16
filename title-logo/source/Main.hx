package;

import flixel.FlxG;
import flixel.FlxGame;
import openfl.display.Sprite;

class Main extends Sprite
{
	public function new()
	{
		super();

		addChild(new FlxGame(920, 75, PlayState, 1, 60, 60, true, false));
		FlxG.camera.pixelPerfectRender = false;
	}
}