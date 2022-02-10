package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.ui.FlxVirtualPad;

class PlayState extends FlxState
{
	var sprite:FlxSprite;
	var pad:FlxVirtualPad;

	override public function create()
	{
		bgColor = 0;

super.create();

		sprite = new FlxSprite("assets/sprite.png");
		sprite.screenCenter();
		add(sprite);

		pad = new FlxVirtualPad(FlxDPadMode.FULL, FlxActionMode.NONE);
		add(pad);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		var up:Bool = pad.buttonUp.pressed || FlxG.keys.anyPressed([UP, W]);
		var down:Bool = pad.buttonDown.pressed || FlxG.keys.anyPressed([DOWN, S]);
		var left:Bool = pad.buttonLeft.pressed || FlxG.keys.anyPressed([LEFT, A]);
		var right:Bool = pad.buttonRight.pressed || FlxG.keys.anyPressed([RIGHT, D]);

		if (up && down)
			up = down = false;
		if (left && right)
			left = right = false;

		if (up)
			sprite.velocity.y = -100;
		else if (down)
			sprite.velocity.y = 100;
		else
			sprite.velocity.y = 0;

		if (left)
			sprite.velocity.x = -100;
		else if (right)
			sprite.velocity.x = 100;
		else
			sprite.velocity.x = 0;
	}
}
