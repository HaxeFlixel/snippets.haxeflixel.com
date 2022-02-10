package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	private var statusText:FlxText;

	override public function create()
	{
		bgColor = 0;

		var sprite:FlxSprite = new FlxSprite();
		sprite.loadGraphic("assets/anim-sprite.png", true, 24, 24);
		var animationFrames = [1, 2, 3, 4, 5, 6].concat([for (i in 0...20) 0]);
		sprite.animation.add("shine", animationFrames, 15);
		sprite.animation.play("shine");
		add(sprite);

		FlxTween.circularMotion(sprite, FlxG.width / 2, FlxG.height / 2, FlxG.width / 4, 0, true,
			2, true, {
				type: FlxTweenType.LOOPING
			});

		statusText = new FlxText();
		statusText.size = 16;
		statusText.text = "timeScale: 1";
		statusText.autoSize = false;
		statusText.wordWrap = false;
		statusText.fieldWidth = FlxG.width;
		statusText.color = FlxColor.BLACK;
		statusText.setBorderStyle(FlxTextBorderStyle.SHADOW, FlxColor.GRAY, 2, 1);
		statusText.alignment = FlxTextAlign.LEFT;
		statusText.x = statusText.y = 10;
		add(statusText);

		FlxTween.num(.05, 2, 5, {type: FlxTweenType.PINGPONG}, updateTimeScale);

		super.create();
	}

	private function updateTimeScale(Value:Float):Void
	{
		FlxG.timeScale = Value;
		statusText.text = "timeScale: " + Std.string(FlxMath.roundDecimal(Value, 2));
	}
}
