package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.ui.FlxVirtualPad;

class PlayState extends FlxState
{
	var sprite:FlxSprite;
	var box:FlxSprite;
	var pad:FlxVirtualPad;
	
	var jumpTimer:Float = 0;
	var jumping:Bool = false;
	
	override function create()
	{
		super.create();
		
		sprite = new FlxSprite("assets/sprite.png");
		sprite.x = FlxG.width / 2 - sprite.width / 2;
		sprite.acceleration.y = 900;
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
	
	override function update(elapsed:Float)
	{
		// call super.update first, because it will set touching flags to NONE
		super.update(elapsed);
		
		// If sprite is resting on box it will set its touching to DOWN
		FlxG.collide(box, sprite);
		
		var jumpPressed:Bool = pad.buttonA.pressed;
		
		if (jumping && !jumpPressed)
		{
			jumping = false;
		}
		
		/*
		 * Reset jumpTimer when touching the floor
		 * Note: This sprite's touching flags are set via FlxG.collide,
		 * and are reset to false on super.update
		 */
		if (sprite.isTouching(DOWN) && !jumping)
		{
			jumpTimer = 0;
		}
		
		if (jumpTimer >= 0 && jumpPressed)
		{
			jumping = true;
			jumpTimer += elapsed;
		}
		else
		{
			jumpTimer = -1;
		}
		
		// hold button to jump higher (up to 0.25s)
		if (jumpTimer > 0 && jumpTimer < 0.25)
		{
			sprite.velocity.y = -300;
		}
	}
}
