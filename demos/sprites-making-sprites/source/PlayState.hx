package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxColor;
using flixel.util.FlxSpriteUtil;

class PlayState extends FlxState
{
	override public function create():Void
	{
		bgColor = 0;
		super.create();
		
		var sprite = new FlxSprite();
		sprite.makeGraphic(128, 64, FlxColor.RED);
		sprite.screenCenter();
		add(sprite);
	}
}
