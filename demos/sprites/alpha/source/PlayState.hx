package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;

class PlayState extends FlxState
{
	private var alpha:Float = 1;
	private var sprite:FlxSprite;
	private var alphaDir:Int = -1;
	
	override public function create():Void
	{
		bgColor = 0;
		super.create();
		
		sprite = new FlxSprite(AssetPaths.bigbox__png);
		sprite.screenCenter();
		add(sprite);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		alpha += .02 * alphaDir;
		
		if (alpha > 1)
			alphaDir = -1;
		else if (alpha < 0)
			alphaDir = 1;
		
		sprite.alpha = alpha;
	}
}
