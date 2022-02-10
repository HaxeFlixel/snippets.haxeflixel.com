package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	var hue:Float = 0;
	var sprite:FlxSprite;

	override public function create()
	{
		bgColor = 0;

super.create();

		sprite = new FlxSprite("assets/bigbox.png");
		sprite.screenCenter();
		add(sprite);
	}

	override public function update(elapsed:Float)
	{
		hue += elapsed * 50;
		if (hue > 360)
			hue -= 360;

		var color = FlxColor.fromHSB(Std.int(hue), 1, 1);
		sprite.color = color;

		super.update(elapsed);
	}
}
