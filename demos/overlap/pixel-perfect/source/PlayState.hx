package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxCollision;

class PlayState extends FlxState
{
	var circle:FlxSprite;
	var box:FlxSprite;
	var overlaps:Bool;
	
	override function create()
	{
		super.create();
		
		box = new FlxSprite("assets/bigbox.png");
		box.screenCenter();
		box.angularVelocity = 180;
		// tween scale up and down
		FlxTween.tween(box.scale, {x: 0.5, y: 0.5}, 2 / 3, {type: PINGPONG, ease: FlxEase.sineInOut});
		
		add(box);
		
		circle = new FlxSprite("assets/sprite.png");
		circle.screenCenter();
		// move right so it only touches at certain angles
		circle.x += (box.width + circle.width) * 0.55;
		add(circle);
	}
	
	override function update(elapsed:Float)
	{
		super.update(elapsed);
		
		final overlaps = FlxCollision.pixelPerfectCheck(circle, box);
		box.alpha = overlaps ? 0.5 : 1;
	}
}
