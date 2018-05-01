package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	
	var timer:Float = 2;
	
	override public function create():Void
	{
		bgColor = 0;
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		
		timer -= elapsed;
		if (timer <= 0)
		{
			timer = 2;
			FlxG.camera.flash(FlxColor.fromHSB(FlxG.random.int(0, 360), 1, 1));
		}
		
		super.update(elapsed);
	}
}
