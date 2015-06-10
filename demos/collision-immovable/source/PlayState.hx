package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;

class PlayState extends FlxState
{

	private var spriteA:FlxSprite;
	private var boxA:FlxSprite;
	
	private var spriteB:FlxSprite;
	private var boxB:FlxSprite;
	
	override public function create():Void
	{
		bgColor = 0;
		super.create();
		
		boxA = new FlxSprite(AssetPaths.bigbox__png);
		boxA.x = FlxG.width - boxA.width - 16;
		boxA.y = FlxG.height * .25 - boxA.height / 2;
		add(boxA);
		
		boxB = new FlxSprite(AssetPaths.bigbox__png);
		boxB.x = FlxG.width - boxB.width - 16;
		boxB.y = FlxG.height * .75 - boxB.height / 2;
		add(boxB);
		
		
		spriteA = new FlxSprite(AssetPaths.sprite__png);
		spriteA.x = 16;
		spriteA.y = FlxG.height * .25 - spriteA.height / 2;
		spriteA.velocity.x = 100;
		add(spriteA);
		
		
		spriteB = new FlxSprite(AssetPaths.sprite__png);
		spriteB.x = 16;
		spriteB.y = FlxG.height * .75 - spriteB.height / 2;
		spriteB.velocity.x = 100;
		add(spriteB);
		
		
		boxB.immovable = true;
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		FlxG.collide(spriteA, boxA);
		FlxG.collide(spriteB, boxB);
		
		if (spriteA.x >= FlxG.width)
		{
			spriteA.x = spriteB.x = 16;
			boxA.x = FlxG.width - boxA.width - 16;
		}
	}
}
