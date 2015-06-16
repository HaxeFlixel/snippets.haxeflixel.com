package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	
	override public function create():Void
	{
		bgColor = 0;
		super.create();
		
		var sprite:FlxSprite = new FlxSprite();
		sprite.makeGraphic(128, 64, FlxColor.RED);
		sprite.x = FlxG.width / 2 - sprite.width / 2;
		sprite.y = FlxG.height / 2 - sprite.height / 2;
		add(sprite);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
	
	
}
