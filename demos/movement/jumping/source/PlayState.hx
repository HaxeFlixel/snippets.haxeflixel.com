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
		// call super.update first, as it sets touching flags to NONE
		super.update(elapsed);
		
		// If sprite is resting on box it will set its touching to DOWN
		FlxG.collide(box, sprite);
		
		// jump if touching the box, and jump is pressed
		if (sprite.isTouching(DOWN) && pad.getButton(A).justPressed)
		{
			sprite.velocity.y = -300;
		}
	}
}
