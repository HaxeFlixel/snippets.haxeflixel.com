package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
using flixel.util.FlxSpriteUtil;

class PlayState extends FlxState
{

	private var box:FlxSprite;
	private var sprite:FlxSprite;
	
	override public function create():Void
	{
		bgColor = 0;
		super.create();
		
		box = new FlxSprite(AssetPaths.bigbox__png);
		box.screenCenter(true, true);
		
		sprite = new FlxSprite(AssetPaths.sprite__png);
		sprite.screenCenter(true, true);
		
		add(box);
		add(sprite);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
