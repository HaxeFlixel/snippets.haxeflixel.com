package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;

class PlayState extends FlxState
{
	var sprite:FlxSprite;
	var box:FlxSprite;
	
	override function create()
	{
		super.create();
		
		box = new FlxSprite("assets/bigbox.png");
		box.screenCenter();
		add(box);
		
		sprite = new FlxSprite("assets/sprite.png");
		sprite.y = FlxG.height / 2 - sprite.height / 2;
		sprite.velocity.x = 100;
		add(sprite);
	}
	
	override function update(elapsed:Float)
	{
		super.update(elapsed);
		// if touching the right side of the screen
		if (sprite.velocity.x > 0 && sprite.x >= FlxG.width - sprite.width)
		{
			sprite.velocity.x *= -1;
		}
		// if touching the left side of the screen
		else if (sprite.velocity.x < 0 && sprite.x <= 0)
		{
			sprite.velocity.x *= -1;
		}
		
		box.alpha = FlxG.overlap(sprite, box) ? 0.5 : 1;
	}
}
