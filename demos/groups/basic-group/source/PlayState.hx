package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.system.FlxAssets.FlxGraphicAsset;

class PlayState extends FlxState
{
	var groupA:FlxGroup;
	var groupB:FlxGroup;
	
	override public function create():Void
	{
		bgColor = 0;
		super.create();
		
		add(groupA = new FlxGroup());
		add(groupB = new FlxGroup());
		
		for (i in 0...50)
		{
			groupA.add(createSprite(AssetPaths.bigbox__png));
			groupB.add(createSprite(AssetPaths.sprite__png));
		}
	}
	
	function createSprite(graphic:FlxGraphicAsset):FlxSprite
	{
		var sprite = new FlxSprite(graphic);
		sprite.x = FlxG.random.int(0, Std.int(FlxG.width - sprite.width));
		sprite.y = FlxG.random.int(0, Std.int(FlxG.height - sprite.height));
		return sprite;
	}
}
