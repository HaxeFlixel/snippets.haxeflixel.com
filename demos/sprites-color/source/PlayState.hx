package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	
	private var hue:Float = 0;
	private var sprite:FlxSprite;
	
	override public function create():Void
	{
		bgColor = 0;
		super.create();
		
		sprite = new FlxSprite(AssetPaths.bigbox__png);
		sprite.x = FlxG.width / 2 - sprite.width / 2;
		sprite.y = FlxG.height / 2 - sprite.height / 2;
		add(sprite);
	}

	override public function update(elapsed:Float):Void
	{
		
		hue += elapsed * 50;
		if (hue > 360)
			hue-= 360;
			
		var color = FlxColor.fromHSB(Std.int(hue), 1, 1);
		sprite.color = color;
		
		super.update(elapsed);
		
	}
}
