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
		add(sprite);
		
		sprite.velocity.x = 50;
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		if (sprite.x >= FlxG.width)
			sprite.x = -sprite.width;
	}
}
