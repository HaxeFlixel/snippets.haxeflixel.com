package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;

class PlayState extends FlxState
{
	var sprite:FlxSprite;
	var flipTimer:Float = 1;

	override public function create()
	{
		super.create();

		sprite = new FlxSprite("assets/arrow.png");
		sprite.screenCenter();
		sprite.facing = FlxObject.RIGHT;
		sprite.setFacingFlip(FlxObject.RIGHT, false, false);
		sprite.setFacingFlip(FlxObject.LEFT, true, false);
		add(sprite);
	}

	override public function update(elapsed:Float)
	{
		flipTimer -= elapsed;
		if (flipTimer <= 0)
		{
			if (sprite.facing == FlxObject.RIGHT)
				sprite.facing = FlxObject.LEFT;
			else
				sprite.facing = FlxObject.RIGHT;

			flipTimer++;
		}
		super.update(elapsed);
	}
}
