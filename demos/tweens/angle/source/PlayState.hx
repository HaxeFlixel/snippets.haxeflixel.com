package;

import flixel.FlxSprite;
import flixel.FlxState;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;

class PlayState extends FlxState
{
	var sprite:FlxSprite;
	
	override function create()
	{
		super.create();
		
		sprite = new FlxSprite("assets/arrow.png");
		sprite.screenCenter();
		add(sprite);
		
		FlxTween.angle(sprite, 0, 180, 1, {type: FlxTweenType.PINGPONG, ease: FlxEase.backInOut});
	}
}
