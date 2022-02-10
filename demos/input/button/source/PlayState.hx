package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	override public function create()
	{
		bgColor = 0;

super.create();

		var button = new FlxButton(0, 0, "Click me", onButtonClicked);
		button.screenCenter();
		add(button);
	}

	function onButtonClicked()
	{
		FlxG.camera.flash(FlxColor.WHITE, 0.33);
	}
}
