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
		
		sprite = new FlxSprite();
		sprite.loadRotatedGraphic(AssetPaths.arrow__png, 16);
		sprite.x = FlxG.width / 2 - sprite.width / 2;
		sprite.y = FlxG.height / 2 - sprite.height / 2;
		add(sprite);
	}

	override public function update(elapsed:Float):Void
	{
		
		sprite.angle++;
		
		super.update(elapsed);
	}
}
