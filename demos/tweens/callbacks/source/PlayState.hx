package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;

class PlayState extends FlxState
{
	var spriteA:FlxSprite;
	var spriteB:FlxSprite;

	override public function create()
	{
		spriteA = new FlxSprite("assets/sprite.png");
		spriteA.x = spriteA.y = 50;
		add(spriteA);

		spriteB = new FlxSprite("assets/bigbox.png");
		spriteB.x = 50;
		spriteB.y = FlxG.height - spriteB.height - 50;
		add(spriteB);

		bgColor = 0;

		super.create();

		moveA();
	}

	private function moveA(?_):Void
	{
		FlxTween.linearMotion(spriteA, 50, 50, FlxG.width - spriteA.width - 50, 50, 1, true, {
			type: FlxTweenType.ONESHOT,
			ease: FlxEase.sineInOut,
			onComplete: moveB
		});
	}

	private function moveB(_):Void
	{
		FlxTween.linearMotion(spriteB, 50, FlxG.height - spriteB.height - 50,
			FlxG.width - spriteB.width - 50, FlxG.height - spriteB.height - 50, 1, true, {
				type: FlxTweenType.ONESHOT,
				ease: FlxEase.sineInOut,
				onComplete: moveABack
			});
	}

	private function moveABack(_):Void
	{
		FlxTween.linearMotion(spriteA, FlxG.width - spriteA.width - 50, 50, 50, 50, 1, true, {
			type: FlxTweenType.ONESHOT,
			ease: FlxEase.sineInOut,
			onComplete: moveBBack
		});
	}

	private function moveBBack(_):Void
	{
		FlxTween.linearMotion(spriteB, FlxG.width - spriteB.width - 50,
			FlxG.height - spriteB.height - 50, 50, FlxG.height - spriteB.height - 50, 1, true, {
				type: FlxTweenType.ONESHOT,
				ease: FlxEase.sineInOut,
				onComplete: moveA
			});
	}
}
