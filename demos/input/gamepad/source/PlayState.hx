package;

import flixel.text.FlxText;
import flixel.input.gamepad.FlxGamepad;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.ui.FlxVirtualPad;

class PlayState extends FlxState
{
	final speed:Int = 100;
	var sprite:FlxSprite;
	var status:FlxText;

	override public function create()
	{
		bgColor = 0;

		super.create();

		sprite = new FlxSprite("assets/sprite.png");
		sprite.screenCenter();
		add(sprite);

		status = new FlxText(0, 12, FlxG.width, "No controller connected", 12);
		status.alignment = FlxTextAlign.CENTER;
		status.color = 0xff000000;
		add(status);

	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		var gamepad:FlxGamepad = FlxG.gamepads.lastActive;

		if (gamepad == null){
			status.text = "No controller connected";
		} else {
			status.text = "Controller connected";
			getControls(gamepad);
		}
	}

	function getControls(gamepad:FlxGamepad) {
		var h:Float = gamepad.getXAxis(LEFT_ANALOG_STICK) * speed;
		var v:Float = gamepad.getYAxis(LEFT_ANALOG_STICK) * speed;

		if(gamepad.pressed.DPAD_LEFT)
			h = -speed;
		else if(gamepad.pressed.DPAD_RIGHT)
			h = speed;
		
		if(gamepad.pressed.DPAD_UP)
			v = -speed;
		else if(gamepad.pressed.DPAD_DOWN)
			v = speed;

		sprite.velocity.x = h;
		sprite.velocity.y = v;
	}
}
