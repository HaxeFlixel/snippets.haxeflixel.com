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
		
		var text:FlxText = new FlxText(0, 8, FlxG.width, "The Screen's Dimensions are " + Std.string(FlxG.width) + "x"  + Std.string(FlxG.height));
		text.alignment = FlxTextAlign.CENTER;
		text.setBorderStyle(FlxTextBorderStyle.SHADOW, 0xff333333);
		add(text);
		
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
