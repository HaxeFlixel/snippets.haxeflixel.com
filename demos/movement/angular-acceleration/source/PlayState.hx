package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;

class PlayState extends FlxState
{
	var sprite:FlxSprite;
	
	override function create()
	{
		super.create();
		
		sprite = new FlxSprite("assets/arrow.png");
		sprite.screenCenter();
		add(sprite);
		
		sprite.angularAcceleration = 30;
	}
	
	override function update(elapsed:Float)
	{
		if (Math.abs(sprite.angularVelocity) >= 600)
			sprite.angularAcceleration *= -1;
			
		super.update(elapsed);
	}
}
