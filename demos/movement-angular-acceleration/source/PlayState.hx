package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
using flixel.util.FlxSpriteUtil;

class PlayState extends FlxState
{
	private var sprite:FlxSprite;
	
	override public function create():Void
	{
		bgColor = 0;
		super.create();
		
		sprite = new FlxSprite(AssetPaths.arrow__png);
		sprite.screenCenter();
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
