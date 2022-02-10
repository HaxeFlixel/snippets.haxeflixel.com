package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.math.FlxMath;
import flixel.math.FlxPoint;
import flixel.math.FlxVelocity;

class PlayState extends FlxState
{
	private var mover:FlxSprite;
	private var target:FlxSprite;

	override public function create()
	{
		bgColor = 0;

		add(target = new FlxSprite("assets/bigbox.png"));
		target.x = FlxG.width - target.width - 10;
		target.y = FlxG.height - target.height - 10;
		target.offset.x = target.width / 2;
		target.offset.y = target.height / 2;

		add(mover = new FlxSprite("assets/sprite.png"));
		mover.x = 10;
		mover.y = 10;
		mover.offset.x = mover.width / 2;
		mover.offset.y = mover.height / 2;

		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		if (FlxMath.inBounds(FlxG.mouse.x, 0, FlxG.width)
			&& FlxMath.inBounds(FlxG.mouse.y, 0, FlxG.height))
		{
			if (FlxMath.isDistanceToMouseWithin(target, 10))
			{
				target.velocity.set();
			}
			else
				FlxVelocity.moveTowardsMouse(target, 100);

			if (FlxMath.isDistanceWithin(mover, target, 10))
			{
				mover.velocity.set();
			}
			else
				FlxVelocity.moveTowardsObject(mover, target, 20);
		}
		else
			target.velocity.set();

		super.update(elapsed);
	}
}
