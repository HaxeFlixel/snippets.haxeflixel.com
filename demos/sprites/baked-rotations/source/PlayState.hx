package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;

class PlayState extends FlxState
{
	var sprite:FlxSprite;

	override public function create()
	{
		super.create();

		sprite = new FlxSprite();
		sprite.loadRotatedGraphic("assets/arrow.png", 16);
		sprite.screenCenter();
		add(sprite);
	}

	override public function update(elapsed:Float)
	{
		sprite.angle++;

		super.update(elapsed);
	}
}
