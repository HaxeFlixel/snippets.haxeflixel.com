package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.tile.FlxTilemap;

class PlayState extends FlxState
{
	override public function create()
	{
		super.create();

		var map = new FlxTilemap();
		map.loadMapFromCSV("assets/map.csv", "assets/tiles.png");
		map.screenCenter();
		add(map);
	}
}
