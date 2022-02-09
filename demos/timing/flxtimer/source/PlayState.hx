package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxTimer;

class PlayState extends FlxState
{
	private var sprite:FlxSprite;

	override public function create()
	{
		bgColor = 0;

		add(sprite = new FlxSprite('assets/sprite.png'));
		sprite.x = (FlxG.width / 2) - (sprite.width / 2);
		sprite.y = FlxG.height - sprite.height;
		sprite.acceleration.y = 200;

		var timer:FlxTimer = new FlxTimer();
		timer.start(5, bounce, 0);

		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);

		sprite.y = Math.min(sprite.y, FlxG.height - sprite.height);
	}

	private function bounce(_):Void
	{
		sprite.velocity.y = -200;
	}
}
