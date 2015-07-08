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
		
		var box = new FlxSprite(AssetPaths.bigbox__png);
		box.screenCenter();
		
		var sprite = new FlxSprite(AssetPaths.sprite__png);
		sprite.screenCenter();
		
		add(box);
		add(sprite);
	}
}
