package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.ui.FlxVirtualPad;

class PlayState extends FlxState
{
	var sprite:FlxSprite;
	var box:FlxSprite;
	var pad:FlxVirtualPad;

	var jump:Float = 0;
	var jumped:Bool = false;

	override public function create()
	{
		super.create();

		sprite = new FlxSprite("assets/sprite.png");
		sprite.x = FlxG.width / 2 - sprite.width / 2;
		sprite.acceleration.y = 600;
		sprite.maxVelocity.y = 300;
		add(sprite);

		box = new FlxSprite("assets/bigbox.png");
		box.x = FlxG.width / 2 - box.width / 2;
		box.y = FlxG.height * 0.75 - box.height / 2;
		box.immovable = true;
		add(box);

		pad = new FlxVirtualPad(FlxDPadMode.NONE, FlxActionMode.A);
		add(pad);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		FlxG.collide(box, sprite);

		var jumpPressed:Bool = pad.buttonA.pressed;

		if (jumped && !jumpPressed)
			jumped = false;

		if (sprite.isTouching(FlxObject.DOWN) && !jumped)
			jump = 0;

		if (jump >= 0 && jumpPressed)
		{
			jumped = true;
			jump += elapsed;
			if (jump > 0.33)
				jump = -1;
		}
		else
			jump = -1;

		if (jump > 0)
		{
			if (jump < 0.065)
				sprite.velocity.y = -360;
			else
				sprite.acceleration.y = 10;
		}
		else
		{
			sprite.velocity.y = 600;
		}
	}
}
