package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxSignal;
import flixel.util.FlxTimer;

class PlayState extends FlxState
{
	private var signal:FlxSignal;

	override public function create()
	{
		bgColor = 0;

		signal = new FlxSignal();

		var sprite:SignalSprite = new SignalSprite();
		sprite.x = (FlxG.width / 4) - (sprite.width / 2);
		sprite.y = FlxG.height - sprite.height;
		signal.add(sprite.bounce);
		add(sprite);

		sprite = new SignalSprite();
		sprite.x = (FlxG.width * .75) - (sprite.width / 2);
		sprite.y = FlxG.height - sprite.height;
		signal.add(sprite.bounce);
		add(sprite);

		var timer:FlxTimer = new FlxTimer();
		timer.start(5, callSignal, 0);

		super.create();
	}

	private function callSignal(_):Void
	{
		signal.dispatch();
	}
}

class SignalSprite extends FlxSprite
{
	public function new()
	{
		super('assets/sprite.png');
		acceleration.y = 200;
	}

	public function bounce():Void
	{
		velocity.y = -200;
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);

		y = Math.min(y, FlxG.height - height);
	}
}
