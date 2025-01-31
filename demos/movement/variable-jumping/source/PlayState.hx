package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.ui.FlxVirtualPad;

class PlayState extends FlxState
{
	static inline var JUMP_TIME = 0.25;
	
	var sprite:FlxSprite;
	var box:FlxSprite;
	
	var pad:FlxVirtualPad;
	
	var jumpTimer:Float = 0;
	
	override function create()
	{
		super.create();
		
		box = new FlxSprite("assets/bigbox.png");
		box.screenCenter(X);
		box.y = FlxG.height * 0.75 - box.height / 2;
		box.immovable = true;
		add(box);
		
		sprite = new FlxSprite("assets/sprite.png");
		sprite.screenCenter(X);
		sprite.acceleration.y = 900;
		sprite.maxVelocity.y = 300;
		add(sprite);
		
		pad = new FlxVirtualPad(FlxDPadMode.NONE, FlxActionMode.A);
		add(pad);
	}
	
	override function update(elapsed:Float)
	{
		// call super.update first, as it sets touching flags to NONE
		super.update(elapsed);
		
		// If sprite is resting on box it will set its touching to DOWN
		FlxG.collide(box, sprite);
		
		// Reset jumpTimer when touching the floor and jump is pressed
		if (sprite.isTouching(DOWN) && pad.getButton(A).justPressed)
		{
			jumpTimer = 0;
		}
		
		// hold button to jump higher (up to 0.25s)
		if (pad.buttonA.pressed)
		{
			jumpTimer += elapsed;
			
			if (jumpTimer < JUMP_TIME)
			{
				sprite.velocity.y = -300;
			}
		}
		else
		{
			// stop jumping after they release
			jumpTimer = JUMP_TIME;
		}
	}
}
