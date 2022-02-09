package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;

class PlayState extends FlxState
{
	var sprite:FlxSprite;
	var scaleDir:Int = 1;

	override public function create()
	{
		bgColor = 0;

		super.create();

		sprite = new FlxSprite("assets/sprite.png");
		sprite.screenCenter();
		sprite.scale.set(0.5, 2);
		add(sprite);
	}

	override public function update(elapsed:Float)
	{
		sprite.scale.x += elapsed * 5 * scaleDir;
		sprite.scale.y -= elapsed * 5 * scaleDir;

		if (sprite.scale.x >= 4
			|| sprite.scale.x <= 0.5
			|| sprite.scale.y >= 4
			|| sprite.scale.y <= 0.5)
			scaleDir *= -1;

		super.update(elapsed);
	}
}
