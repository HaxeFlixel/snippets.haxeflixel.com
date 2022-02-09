package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;

class PlayState extends FlxState
{
	var sprite:FlxSprite;

	override public function create()
	{
		sprite = new FlxSprite("assets/sprite.png");
		sprite.x = sprite.y = 50;
		add(sprite);

		bgColor = 0;

		super.create();

		FlxTween.tween(sprite,
			{x: FlxG.width - sprite.width - 50, y: FlxG.height - sprite.height - 50, angle: 360},
			3, {type: FlxTweenType.PINGPONG, ease: FlxEase.sineInOut});
	}
}
