package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;

class Platform extends FlxSprite
{
	public function new(?X:Float = 0, ?Y:Float = 0)
	{
		super(X, Y, "assets/bigbox.png");
	}
}
