package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

class PlayState extends FlxState
{
	override public function create()
	{
		bgColor = 0;

super.create();

		var soundBox:FlxButton = new FlxButton(0, 0, "Play Sound", playSound);
		soundBox.screenCenter();
		add(soundBox);
	}

	function playSound()
	{
		FlxG.sound.play("assets/just-a-breath.mp3");
	}
}
