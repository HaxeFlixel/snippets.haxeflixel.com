package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;

class PlayState extends FlxState
{
	
	private var groupA:FlxGroup;
	private var groupB:FlxGroup;
	
	override public function create():Void
	{
		bgColor = 0;
		super.create();
		
		groupA = new FlxGroup();
		add(groupA);
		
		groupB = new FlxGroup();
		add(groupB);
		
		var spr:FlxSprite;
		for (i in 0...50)
		{
			spr = new FlxSprite(AssetPaths.bigbox__png);
			spr.x = FlxG.random.int(0, Std.int(FlxG.width - spr.width));
			spr.y = FlxG.random.int(0, Std.int(FlxG.height - spr.height));
			groupA.add(spr);
			
			spr = new FlxSprite(AssetPaths.sprite__png);
			spr.x = FlxG.random.int(0, Std.int(FlxG.width - spr.width));
			spr.y = FlxG.random.int(0, Std.int(FlxG.height - spr.height));
			groupB.add(spr);
		}
		
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);	
	}
}
