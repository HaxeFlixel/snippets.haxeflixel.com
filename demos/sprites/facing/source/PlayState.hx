package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;

class PlayState extends FlxState
{
	var sprite:FlxSprite;
	var flipTimer:Float = 1;

	override public function create()
	{
		bgColor = 0;

		super.create();

		sprite = new FlxSprite("assets/arrow.png");
		sprite.screenCenter();
		sprite.facing = RIGHT;
		sprite.setFacingFlip(RIGHT, false, false);
		sprite.setFacingFlip(LEFT, true, false);
		add(sprite);
	}

	override public function update(elapsed:Float)
	{
		flipTimer -= elapsed;
		if (flipTimer <= 0)
		{
			if (sprite.facing == RIGHT)
				sprite.facing = LEFT;
			else
				sprite.facing = RIGHT;

			flipTimer++;
		}
		super.update(elapsed);
	}
}
