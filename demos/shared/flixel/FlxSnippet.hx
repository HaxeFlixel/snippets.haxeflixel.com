package flixel;

import flixel.FlxG;
import flixel.FlxGame;
import flixel.FlxState;

class FlxSnippet extends FlxGame
{
	public function new(gameWidth = 0, gameHeight = 0, initialState:Class<FlxState>, updateFramerate = 60, drawFramerate = 60)
	{
		super(gameWidth, gameHeight, initialState, updateFramerate, drawFramerate, true);
		FlxG.autoPause = false;
		
		// show graph bg
		FlxG.signals.postStateSwitch.add(() -> FlxG.cameras.bgColor = 0x0);
	}
}
