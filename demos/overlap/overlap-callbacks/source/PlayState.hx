package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;

class PlayState extends FlxState
{
	private var sprite:FlxSprite;
	private var box:FlxSprite;
	private var overlaps:Bool;
	
	override public function create():Void
	{
		bgColor = 0;
		super.create();
		
		box = new FlxSprite(AssetPaths.bigbox__png);
		box.screenCenter();
		add(box);
		
		sprite = new FlxSprite(AssetPaths.sprite__png);
		sprite.y = FlxG.height / 2 - sprite.height / 2;
		sprite.velocity.x = 100;
		add(sprite);
	}

	override public function update(elapsed:Float):Void
	{
		if ((sprite.velocity.x > 0 && sprite.x >= FlxG.width - sprite.width)
			|| (sprite.velocity.x < 0 && sprite.x <= 0))
		{
			sprite.velocity.x *= -1;
		}
		
		overlaps = false;
		FlxG.overlap(sprite, box, doOverlap, doOverlapCheck);
		box.alpha = overlaps ? .5 : 1;
		
		super.update(elapsed);
	}
	
	private function doOverlap(objectA:FlxSprite, objectB:FlxSprite):Void
	{
		overlaps = true;
	}
	
	private function doOverlapCheck(objectA:FlxSprite, objectB:FlxSprite):Bool
	{
		return objectA.velocity.x > 0;
	}
}
