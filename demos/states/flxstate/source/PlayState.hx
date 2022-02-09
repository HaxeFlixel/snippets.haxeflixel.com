package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.util.FlxDestroyUtil;

class PlayState extends FlxState
{
	override public function create()
	{
		var text = new FlxText();
		text.text = "I am the PlayState.";
		text.color = FlxColor.CYAN;
		text.size = 16;
		text.setBorderStyle(FlxTextBorderStyle.SHADOW, FlxColor.BLUE, 4);
		text.screenCenter();
		add(text);

		var button = new FlxButton(0, 0, "Switch States", switchState);
		button.screenCenter();
		button.y = text.y + text.height + 16;
		add(button);

		bgColor = 0;

super.create();
	}

	private function switchState():Void
	{
		FlxG.switchState(new OtherState());
	}
}

class OtherState extends FlxState
{
	override public function create()
	{
		var text = new FlxText();
		text.text = "I am the OtherState.";
		text.color = FlxColor.PINK;
		text.size = 16;
		text.setBorderStyle(FlxTextBorderStyle.SHADOW, FlxColor.RED, 4);
		text.screenCenter();
		add(text);

		var button = new FlxButton(0, 0, "Switch States", switchState);
		button.screenCenter();
		button.y = text.y + text.height + 16;
		add(button);

		bgColor = 0;

super.create();
	}

	private function switchState():Void
	{
		FlxG.switchState(new PlayState());
	}
}
