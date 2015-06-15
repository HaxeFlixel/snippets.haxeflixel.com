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
		
		var mapData:Array<Array<Int>> = [
			[2, 2, 2, 2, -1, -1, -1, -1, -1, 3, 3, 3, 3],
			[2, 2, 2, 2, 2, -1, -1, -1, 3, 3, 3, 3, 3],
			[2, 2, 2, 2, 2, 2, 1, 3, 3, 3, 3, 3, 3],
			[2, 2, 2, 2, 2, 1, 1, 1, 3, 3, 3, 3, 3],
			[ -1, 2, 2, 2, 1, 1, 1, 1, 1, 3, 3, 3, -1],
			[ -1, -1, 2, 1, 1, 1, 1, 1, 1, 1, 3, -1, -1],
			[ -1, -1, 1, 1, 1, 1, 1, 1, 1, 1, 1, -1, -1],
			[ -1, -1, 4, 1, 1, 1, 1, 1, 1, 1, 5, -1, -1],
			[ -1, 4, 4, 4, 1, 1, 1, 1, 1, 5, 5, 5, -1],
			[4, 4, 4, 4, 4, 1, 1, 1, 5, 5, 5, 5, 5],
			[4, 4, 4, 4, 4, 4, 1, 5, 5, 5, 5, 5, 5],
			[4, 4, 4, 4, 4, -1, -1, -1, 5, 5, 5, 5, 5],
			[4, 4, 4, 4, -1, -1, -1, -1, -1, 5, 5, 5, 5]
		];
		
		map = new FlxTilemap();
		map.loadMapFrom2DArray(mapData, AssetPaths.tiles__png);
		map.x = FlxG.width / 2 - map.width / 2;
		map.y = FlxG.height / 2 - map.height / 2;
		add(map);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
