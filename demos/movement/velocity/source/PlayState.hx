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

		sprite = new FlxSprite("assets/sprite.png");
		sprite.y = FlxG.height / 2 - sprite.height / 2;
		add(sprite);

		sprite.velocity.x = 100;
	}

	override public function update(elapsed:Float)
	{
		if (sprite.velocity.x > 0 && sprite.x >= FlxG.width - sprite.width)
		{
			sprite.x = FlxG.width - sprite.width;
			sprite.velocity.x *= -1;
		}
		else if (sprite.velocity.x < 0 && sprite.x <= 0)
		{
			sprite.x = 0;
			sprite.velocity.x *= -1;
		}

		super.update(elapsed);
	}
}
