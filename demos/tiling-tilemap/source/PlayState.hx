package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.tile.FlxTilemap;

class PlayState extends FlxState
{
	private var map:FlxTilemap;
	
	override public function create():Void
	{
		bgColor = 0;
		super.create();
		
		map = new FlxTilemap();
		map.loadMapFromCSV(AssetPaths.map__csv, AssetPaths.tiles__png);
		map.x = FlxG.width / 2 - map.width / 2;
		map.y = FlxG.height / 2 - map.height / 2;
		add(map);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
