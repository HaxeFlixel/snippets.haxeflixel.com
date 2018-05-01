package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;

class PlayState extends FlxState
{
	var sprite:FlxSprite;
	
	override public function create():Void
	{
		bgColor = 0;
		super.create();
		
		sprite = new FlxSprite(AssetPaths.arrow__png);
		sprite.screenCenter();
		add(sprite);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		sprite.angle += elapsed * 30;
	}
}
