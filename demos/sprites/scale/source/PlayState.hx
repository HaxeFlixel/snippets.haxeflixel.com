package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
using flixel.util.FlxSpriteUtil;

class PlayState extends FlxState
{
	private var sprite:FlxSprite;
	private var scaleDir:Int = 1;
	
	override public function create():Void
	{
		bgColor = 0;
		super.create();
		
		sprite = new FlxSprite(AssetPaths.sprite__png);
		sprite.screenCenter();
		sprite.scale.set(.5, 2);
		add(sprite);
	}

	override public function update(elapsed:Float):Void
	{
		sprite.scale.x += elapsed * 5 * scaleDir;
		sprite.scale.y -= elapsed * 5 * scaleDir;
		
		if (sprite.scale.x >= 4 || sprite.scale.x <= .5 ||
			sprite.scale.y >= 4 || sprite.scale.y <= .5)
			scaleDir *= -1;
		
		super.update(elapsed);
	}
}
