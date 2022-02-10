package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.tile.FlxTileblock;

class PlayState extends FlxState
{
	override public function create()
	{
		bgColor = 0;

		super.create();

		var block = new FlxTileblock(16, 16, FlxG.width - 32, FlxG.height - 32);
		block.loadTiles("assets/tiles.png", 16, 16);
		add(block);
	}
}
