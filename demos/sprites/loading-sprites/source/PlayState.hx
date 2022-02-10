package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;

class PlayState extends FlxState
{
	override public function create()
	{
		bgColor = 0;

		super.create();

		var sprite = new FlxSprite();
		sprite.loadGraphic("assets/bigbox.png");
		sprite.screenCenter();
		add(sprite);
	}
}
