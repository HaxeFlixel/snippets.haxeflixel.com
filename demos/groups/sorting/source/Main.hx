package;

import openfl.display.Sprite;

class Main extends Sprite
{
	public function new()
	{
		super();
		addChild(new FlxSnippet(0, 0, PlayState));
	}
}

