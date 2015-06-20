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
		
		sprite = new FlxSprite(AssetPaths.arrow__png);
		sprite.x = FlxG.width / 2 - sprite.width / 2;
		sprite.y = FlxG.height / 2 - sprite.height / 2;
		add(sprite);
		
		sprite.angularAcceleration = 30;
	}

	override public function update(elapsed:Float):Void
	{
		
		if (Math.abs(sprite.angularVelocity) >= 600)
			sprite.angularAcceleration *= -1;
		
		super.update(elapsed);
	}
}
