package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	var text:FlxText;

	override public function create()
	{
		text = new FlxText();
		text.text = "0";
		text.color = FlxColor.CYAN;
		text.size = 32;
		text.setBorderStyle(FlxTextBorderStyle.SHADOW, FlxColor.BLUE, 4);
		text.screenCenter();
		add(text);

		bgColor = 0;

		super.create();

		FlxTween.num(0, 100, 10, {type: FlxTweenType.PINGPONG, ease: FlxEase.quintIn}, updateValue);
	}

	private function updateValue(value:Float):Void
	{
		text.text = Std.string(Std.int(value));
	}
}
