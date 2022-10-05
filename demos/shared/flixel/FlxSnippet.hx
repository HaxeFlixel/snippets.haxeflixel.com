package flixel;

import flixel.FlxG;
import flixel.FlxGame;
import flixel.FlxState;

class FlxSnippet extends FlxGame
{
	public function new(gameWidth = 0, gameHeight = 0, initialState:Class<FlxState>,
			updateFramerate = 60, drawFramerate = 60)
	{
		super(gameWidth, gameHeight, initialState, #if (flixel < "5.0.0") 1.0, #end updateFramerate, drawFramerate, true);
		FlxG.autoPause = false;
	}
}
