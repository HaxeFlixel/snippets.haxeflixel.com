package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

class MyClass extends FlxSprite
{

	public function new()
	{
		super(AssetPaths.sprite__png);
		kill();
	}
	
	override public function revive():Void 
	{
		x = -width;
		y = FlxG.random.int(0, Std.int(FlxG.height - height));
		velocity.x = 200;
		super.revive();
	}
	
	override public function update(elapsed:Float):Void 
	{
		if (x > FlxG.width)
			kill();
		super.update(elapsed);
	}
	
}