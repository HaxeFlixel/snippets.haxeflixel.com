package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	var spriteA:FlxSprite;
	var spriteB:FlxSprite;
	
	override public function create():Void
	{
		bgColor = 0;
		super.create();
		
		spriteA = new FlxSprite(AssetPaths.sprite__png);
		spriteA.x = 24;
		spriteA.y = FlxG.height / 2 - spriteA.height / 2;
		add(spriteA);
		
		spriteB = new FlxSprite(AssetPaths.sprite__png);
		spriteB.x = FlxG.width - 24 - spriteB.width;
		spriteB.y = FlxG.height / 2 - spriteB.height / 2;
		add(spriteB);
		
		spriteA.velocity.x = 150;
		spriteB.velocity.x = -150;
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		FlxG.collide(spriteA, spriteB, collision);
		
		if (spriteA.x <= 0)
			spriteA.velocity.x *= -1;
		if (spriteB.x >= FlxG.width - spriteB.width)
			spriteB.velocity.x *= -1;
	}
	
	function collision(spriteA:FlxSprite, spriteB:FlxSprite):Void
	{
		spriteA.velocity.x = -150;
		spriteB.velocity.x = 150;
	}
}
