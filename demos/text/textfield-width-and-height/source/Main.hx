package;

import flixel.FlxSnippet;
import openfl.display.Sprite;

class Main extends Sprite
{
	public function new()
	{
		super();
		addChild(new FlxSnippet(160, 120, PlayState));
	}
}
