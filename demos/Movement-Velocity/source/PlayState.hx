package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;

class PlayState extends FlxState
{
	
	private var _sprTest:FlxSprite;
	
	override public function create():Void
	{
		super.create();
		
		_sprTest = new FlxSprite();
		
	}

	override public function update():Void
	{
		super.update();
	}	
}