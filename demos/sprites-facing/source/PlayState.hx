package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;

class PlayState extends FlxState
{
	
	private var sprite:FlxSprite;
	private var flipTimer:Float = 1;
	
	override public function create():Void
	{
		bgColor = 0;
		super.create();
		
		sprite = new FlxSprite(AssetPaths.arrow__png);
		sprite.x = FlxG.width / 2 - sprite.width / 2;
		sprite.y = FlxG.height / 2 - sprite.height / 2;
		sprite.facing = FlxObject.RIGHT;
		sprite.setFacingFlip(FlxObject.RIGHT, false, false);
		sprite.setFacingFlip(FlxObject.LEFT, true, false);
		add(sprite);
		
	}

	override public function update(elapsed:Float):Void
	{
		
		flipTimer -= elapsed;
		if (flipTimer <= 0)
		{
			sprite.facing = sprite.facing == FlxObject.RIGHT ? FlxObject.LEFT : FlxObject.RIGHT;
			flipTimer++;
		}
		super.update(elapsed);
		
	}
}
