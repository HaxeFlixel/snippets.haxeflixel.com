package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

class Sprite extends FlxSprite
{
	public function new()
	{
		super("assets/sprite.png");
		setPosition(FlxG.random.int(0, Std.int(FlxG.width - width)),
			FlxG.random.int(0, Std.int(FlxG.height - height)));
		velocity.set(FlxG.random.int(50, 200) * FlxG.random.sign(),
			FlxG.random.int(50, 200) * FlxG.random.sign());
	}

	override public function update(elapsed:Float)
	{
		if ((velocity.x > 0 && x + width >= FlxG.width) || (velocity.x < 0 && x <= 0))
			velocity.x *= -1;
		if ((velocity.y > 0 && y + height >= FlxG.height) || (velocity.y < 0 && y <= 0))
			velocity.y *= -1;

		super.update(elapsed);
	}
}
