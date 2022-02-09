package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	var h:FlxSprite;
	var v:FlxSprite;
	var center:FlxSprite;

	override public function create()
	{
		bgColor = 0;

super.create();

		h = new FlxSprite();
		h.makeGraphic(3, FlxG.height, FlxColor.BLUE);
		add(h);

		v = new FlxSprite();
		v.makeGraphic(FlxG.width, 3, FlxColor.BLUE);
		add(v);

		center = new FlxSprite();
		center.makeGraphic(5, 5, FlxColor.YELLOW);
		add(center);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		h.x = FlxG.mouse.x - 1;
		v.y = FlxG.mouse.y - 1;
		center.x = h.x - 1;
		center.y = v.y - 1;
		if (FlxG.mouse.justReleased)
			FlxG.camera.flash(FlxColor.WHITE, 0.33);
	}
}
