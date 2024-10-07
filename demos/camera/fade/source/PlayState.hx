package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	var timer:Float = 0;
	var direction:Bool = false;
	var color:FlxColor;
	
	override function update(elapsed:Float)
	{
		super.update(elapsed);
		
		timer -= elapsed;
		if (timer <= 0)
		{
			timer = 2;
			if (!direction)
			{
				color = FlxColor.fromHSB(FlxG.random.int(0, 360), 1, 1);
			}
			FlxG.camera.fade(color, 1, direction, null, true);
			direction = !direction;
		}
	}
}
