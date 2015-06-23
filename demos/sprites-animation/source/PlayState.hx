package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
using flixel.util.FlxSpriteUtil;

class PlayState extends FlxState
{
	override public function create():Void
	{
		bgColor = 0;
		super.create();
		
		var sprite = new FlxSprite();
		sprite.loadGraphic(AssetPaths.anim_sprite__png, true, 24, 24);
		sprite.screenCenter();
		var animationFrames = [1, 2, 3, 4, 5, 6].concat([for (i in 0...45) 0]);
		sprite.animation.add("shine", animationFrames, 15);
		sprite.animation.play("shine");
		add(sprite);
	}
}
