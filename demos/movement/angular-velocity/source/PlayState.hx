package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;

class PlayState extends FlxState
{
	var sprite:FlxSprite;
	var timer:Float = 0;
	var speed:Int = 1;

	override public function create()
	{
		bgColor = 0;

super.create();

		sprite = new FlxSprite("assets/arrow.png");
		sprite.screenCenter();
		add(sprite);

		sprite.angularVelocity = 30;
	}

	override public function update(elapsed:Float)
	{
		timer += elapsed;
		if (timer >= 2)
		{
			timer = 0;
			speed++;
			if (speed >= 8)
				speed = 1;
			sprite.angularVelocity = speed * 100;
		}

		super.update(elapsed);
	}
}
