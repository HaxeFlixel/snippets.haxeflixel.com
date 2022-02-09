package;

import flixel.FlxSprite;
import flixel.FlxState;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	var sprite:FlxSprite;

	override public function create()
	{
		sprite = new FlxSprite();
		sprite.makeGraphic(128, 128, FlxColor.WHITE);
		sprite.screenCenter();
		add(sprite);

		bgColor = 0;

		super.create();

		FlxTween.color(sprite, 1, FlxColor.RED, FlxColor.CYAN,
			{type: FlxTweenType.PINGPONG, ease: FlxEase.sineInOut});
	}
}
