package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;

class PlayState extends FlxState
{
	private var sprite:FlxSprite;
	
	override public function create():Void
	{
		bgColor = 0;
		super.create();
		
		sprite = new FlxSprite(AssetPaths.sprite__png);
		sprite.y = FlxG.height / 2 - sprite.height / 2;
		sprite.acceleration.x = 320;
		add(sprite);
		
		sprite.maxVelocity.x = 160;
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		if (sprite.acceleration.x > 0 && sprite.x >= FlxG.width - sprite.width)
		{
			sprite.x = FlxG.width - sprite.width;
			sprite.velocity.x = 0;
			sprite.acceleration.x *= -1;
		}
		else if (sprite.acceleration.x < 0 && sprite.x <= 0)
		{
			sprite.x = 0;
			sprite.velocity.x = 0;
			sprite.acceleration.x *= -1;
		}
	}
}
