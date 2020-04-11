package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

class Sprite extends FlxSprite
{
	public function new()
	{
		super("assets/sprite.png");
		kill();
	}

	override public function revive()
	{
		x = -width;
		y = FlxG.random.int(0, Std.int(FlxG.height - height));
		velocity.x = 200;
		super.revive();
	}

	override public function update(elapsed:Float)
	{
		if (x > FlxG.width)
			kill();
		super.update(elapsed);
	}
}
