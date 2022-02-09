package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;

class PlayState extends FlxState
{
	var alpha:Float = 1;
	var sprite:FlxSprite;
	var alphaDir:Int = -1;

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
		super.update(elapsed);

		alpha += 0.02 * alphaDir;

		if (alpha > 1)
			alphaDir = -1;
		else if (alpha < 0)
			alphaDir = 1;

		sprite.alpha = alpha;
	}
}
