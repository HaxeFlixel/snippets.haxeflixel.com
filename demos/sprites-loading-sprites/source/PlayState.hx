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
		sprite.loadGraphic(AssetPaths.bigbox__png);
		sprite.screenCenter();
		add(sprite);
	}
}
