package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.math.FlxMath;

class PlayState extends FlxState
{
	var sprite:FlxSprite;
	var box:FlxSprite;
	var inRange:Bool;

	override public function create()
	{
		bgColor = 0;

		super.create();

		box = new FlxSprite("assets/bigbox.png");
		box.centerOrigin();
		box.screenCenter();
		add(box);

		sprite = new FlxSprite("assets/sprite.png");
		sprite.centerOrigin();
		sprite.y = FlxG.height / 2 - sprite.height / 2;
		sprite.velocity.x = 100;
		add(sprite);
	}

	override public function update(elapsed:Float)
	{
		if ((sprite.velocity.x > 0 && sprite.x >= FlxG.width - sprite.width)
			|| (sprite.velocity.x < 0 && sprite.x <= 0))
		{
			sprite.velocity.x *= -1;
		}

		inRange = false;
		inRange = FlxMath.isDistanceWithin(sprite, box, 100);
		box.alpha = inRange ? 0.5 : 1;

		super.update(elapsed);
	}
}
