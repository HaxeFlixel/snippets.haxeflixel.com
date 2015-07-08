package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.tile.FlxTilemap;

class PlayState extends FlxState
{
	override public function create():Void
	{
		bgColor = 0;
		super.create();
		
		var map = new FlxTilemap();
		map.loadMapFromCSV(AssetPaths.map__csv, AssetPaths.tiles__png);
		map.screenCenter();
		add(map);
	}
}
