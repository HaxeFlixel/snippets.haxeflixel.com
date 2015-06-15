package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.tile.FlxTileblock;

class PlayState extends FlxState
{
	private var block:FlxTileblock;
	
	override public function create():Void
	{
		bgColor = 0;
		super.create();
		
		block = new FlxTileblock(16, 16, FlxG.width - 32, FlxG.height - 32);
		block.loadTiles(AssetPaths.tiles__png, 16, 16);
		add(block);
		
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
