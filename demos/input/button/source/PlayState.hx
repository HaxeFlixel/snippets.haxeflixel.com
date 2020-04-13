package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	var button:FlxButton;

	override public function create()
	{
		super.create();

		button = new FlxButton(120, 110, "Click me", onButtonClicked);
		add(button);
	}

	function onButtonClicked()
	{
		FlxG.camera.flash(FlxColor.WHITE, 0.33);
	}
}
