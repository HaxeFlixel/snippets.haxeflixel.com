package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxAxes;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	var sprite:FlxSprite;

	var healthText:FlxText;

	override public function create()
	{
		bgColor = 0;

super.create();

		sprite = new FlxSprite("assets/sprite.png");
		sprite.screenCenter();
		add(sprite);

		sprite.health = 5;

		healthText = new FlxText();
		healthText.size = 16;
		healthText.text = "Health: 5";
		healthText.autoSize = false;
		healthText.wordWrap = false;
		healthText.fieldWidth = FlxG.width;
		healthText.color = FlxColor.WHITE;
		healthText.setBorderStyle(FlxTextBorderStyle.SHADOW, FlxColor.BLACK, 2, 1);
		healthText.alignment = FlxTextAlign.CENTER;
		healthText.screenCenter(FlxAxes.X);
		healthText.y = 8;
		add(healthText);
	}

	override public function update(elapsed:Float)
	{
		if (sprite.health < -1)
		{
			sprite.health = 5;
			sprite.revive();
		}
		else
			sprite.hurt(elapsed);

		if (sprite.health > 0)
			healthText.text = "Health: " + Std.string(Math.ceil(sprite.health));
		else
			healthText.text = "DEAD!";

		super.update(elapsed);
	}
}
