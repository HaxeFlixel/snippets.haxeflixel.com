package;

import flixel.ui.FlxButton;
import flixel.FlxG;
import flixel.FlxState;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	var button:FlxButton;

	override public function create()
	{
		super.create();

		button = new FlxButton("Click me", onButtonClicked);
		button.screenCenter();
		add(button);
	}

	function onButtonClicked() {
		FlxG.camera.flash(FlxColor.WHITE, 0.33);
	}
}
