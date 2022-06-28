package;

import flixel.FlxG;
import flixel.FlxGame;
import flixel.FlxState;

class FlxSnippet extends FlxGame
{
	public function new(gameWidth = 0, gameHeight = 0, initialState:Class<FlxState>, updateFramerate = 60, drawFramerate = 60)
	{
		super(gameWidth, gameHeight, initialState, updateFramerate, drawFramerate);
		FlxG.autoPause = false;
	}
}
