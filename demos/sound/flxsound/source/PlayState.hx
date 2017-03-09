package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;

class PlayState extends FlxState
{
	override public function create():Void
	{
		bgColor = 0;
		super.create();

		var soundBox:FlxButton = new FlxButton(0, 0, "Play Sound", playSound);
		soundBox.screenCenter();
		add(soundBox);
	}

	private function playSound():Void
	{
		FlxG.sound.play(AssetPaths.just_a_breath__mp3);
	}
}
