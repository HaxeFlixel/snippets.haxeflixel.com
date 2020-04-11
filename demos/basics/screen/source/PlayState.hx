package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;

class PlayState extends FlxState
{
	override public function create()
	{
		super.create();

		var text = new FlxText(0, 0, FlxG.width,
			"The Screen's dimensions are " + FlxG.width + "x" + FlxG.height);
		text.alignment = FlxTextAlign.CENTER;
		text.setBorderStyle(FlxTextBorderStyle.SHADOW, 0xff333333);
		text.scale.set(1.5, 1.5);
		text.y = FlxG.height / 2 - text.height / 2;
		add(text);
	}
}
