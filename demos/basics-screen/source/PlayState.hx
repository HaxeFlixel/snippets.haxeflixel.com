package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;

class PlayState extends FlxState
{
	
	override public function create():Void
	{
		bgColor = 0;
		super.create();
		
		var text:FlxText = new FlxText(0, 0, FlxG.width, "The Screen's Dimensions are " + Std.string(FlxG.width) + "x"  + Std.string(FlxG.height));
		text.alignment = FlxTextAlign.CENTER;
		text.setBorderStyle(FlxTextBorderStyle.SHADOW, 0xff333333);
		text.scale.set(1.5, 1.5);
		text.x = FlxG.width / 2 - text.width / 2;
		text.y = FlxG.height / 2 - text.height / 2;
		add(text);
		
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
