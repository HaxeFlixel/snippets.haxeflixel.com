package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;

class PlayState extends FlxState
{
	var sprite:FlxSprite;

	override public function create()
	{
		bgColor = 0;

super.create();

		sprite = new FlxSprite("assets/arrow.png");
		sprite.screenCenter();
		add(sprite);

		sprite.angularAcceleration = 30;
	}

	override public function update(elapsed:Float)
	{
		if (Math.abs(sprite.angularVelocity) >= 600)
			sprite.angularAcceleration *= -1;

		super.update(elapsed);
	}
}
