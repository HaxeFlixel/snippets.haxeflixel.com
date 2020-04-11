package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;

class PlayState extends FlxState
{
	var sprite:FlxSprite;

	override public function create()
	{
		super.create();

		sprite = new FlxSprite("assets/arrow.png");
		sprite.screenCenter();
		add(sprite);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		sprite.angle += elapsed * 30;
	}
}
