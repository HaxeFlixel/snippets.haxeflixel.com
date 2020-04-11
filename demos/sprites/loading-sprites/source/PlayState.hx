package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;

class PlayState extends FlxState
{
	override public function create()
	{
		super.create();

		var sprite = new FlxSprite();
		sprite.loadGraphic("assets/bigbox.png");
		sprite.screenCenter();
		add(sprite);
	}
}
