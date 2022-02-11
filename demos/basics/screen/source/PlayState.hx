package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;

class PlayState extends FlxState
{
	override public function create()
	{
		bgColor = 0;

		super.create();

		var text = new FlxText(0, 0, FlxG.width,
			"The Screen's dimensions\nare " + FlxG.width + "x" + FlxG.height + " pixels", 12);

		text.color = 0xff000000;
		text.alignment = FlxTextAlign.CENTER;
		text.setBorderStyle(FlxTextBorderStyle.SHADOW, 0xFF808080);
		text.screenCenter();
		add(text);
	}
}
