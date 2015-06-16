package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;

class PlayState extends FlxState
{
	
	override public function create():Void
	{
		bgColor = 0;
		super.create();
		
		var sprite:FlxSprite = new FlxSprite();
		sprite.loadGraphic(AssetPaths.anim_sprite__png, true, 24, 24);
		sprite.x = FlxG.width / 2 - sprite.width / 2;
		sprite.y = FlxG.height / 2 - sprite.height / 2;
		sprite.animation.add("shine", [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 3, 4, 5, 6], 18);
		sprite.animation.play("shine");
		add(sprite);
		
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
