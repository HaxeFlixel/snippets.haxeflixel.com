package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.tile.FlxTilemap;
import flixel.util.FlxAxes;

class PlayState extends FlxState
{
	var timer:Float = 0;
	var styleNo:Int = -1;
	var style:FlxAxes;

	override public function create()
	{
		bgColor = 0;

super.create();

		var map = new FlxTilemap();
		map.loadMapFromCSV("assets/map.csv", "assets/tiles.png", 16, 16);
		map.screenCenter();
		add(map);
	}

	override public function update(elapsed:Float)
	{
		timer -= elapsed;
		if (timer <= 0)
		{
			timer = 2;
			styleNo++;
			if (styleNo >= 3)
				styleNo = 0;
			style = switch (styleNo)
			{
				case 0: FlxAxes.XY;
				case 1: FlxAxes.X;
				case _: FlxAxes.Y;
			}

			FlxG.camera.shake(0.05, 0.5, null, true, style);
		}

		super.update(elapsed);
	}
}
