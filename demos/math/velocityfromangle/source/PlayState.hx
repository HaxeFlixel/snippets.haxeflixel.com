package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.math.FlxMath;
import flixel.math.FlxVelocity;
import flixel.text.FlxText;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	private var statusText:FlxText;
	private var angle:Float = 30;
	private var sprite:FlxSprite;

	override public function create()
	{
		bgColor = 0;

		sprite = new FlxSprite("assets/sprite.png");
		sprite.screenCenter();
		add(sprite);

		statusText = new FlxText();
		statusText.size = 16;
		statusText.text = "angle: 0";
		statusText.autoSize = false;
		statusText.wordWrap = false;
		statusText.fieldWidth = FlxG.width;
		statusText.color = FlxColor.BLACK;
		statusText.setBorderStyle(FlxTextBorderStyle.SHADOW, FlxColor.GRAY, 2, 1);
		statusText.alignment = FlxTextAlign.LEFT;
		statusText.x = statusText.y = 10;
		add(statusText);

		moveSprite();

		super.create();
	}

	private function moveSprite():Void
	{
		if (angle < 0)
		{
			angle += 360;
		}
		else if (angle > 360)
		{
			angle -= 360;
		}
		sprite.velocity.copyFrom(FlxVelocity.velocityFromAngle(angle, 200));
		statusText.text = "angle: " + Std.string(FlxMath.roundDecimal(angle, 2));
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);

		if (sprite.x < 0)
		{
			sprite.x = 0;
			angle = 2 * 90 - angle;
			moveSprite();
		}
		else if (sprite.x > FlxG.width - sprite.width)
		{
			sprite.x = FlxG.width - sprite.width;
			angle = 2 * 270 - angle;
			moveSprite();
		}

		if (sprite.y < 0)
		{
			sprite.y = 0;
			angle = 2 * 180 - angle;
			moveSprite();
		}
		else if (sprite.y > FlxG.height - sprite.height)
		{
			sprite.y = FlxG.height - sprite.height;
			angle = 2 * 0 - angle;
			moveSprite();
		}
	}
}
