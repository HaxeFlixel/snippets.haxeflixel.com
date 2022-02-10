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

	var time:Float = 1;

	override public function create()
	{
		bgColor = 0;

		super.create();

		sprite = new FlxSprite("assets/sprite.png");
		sprite.screenCenter();
		add(sprite);

		healthText = new FlxText();
		healthText.size = 16;
		healthText.text = "Alive";
		healthText.autoSize = false;
		healthText.wordWrap = false;
		healthText.fieldWidth = FlxG.width;
		healthText.color = FlxColor.BLACK;
		healthText.setBorderStyle(FlxTextBorderStyle.SHADOW, FlxColor.GRAY, 2, 1);
		healthText.alignment = FlxTextAlign.CENTER;
		healthText.screenCenter(FlxAxes.X);
		healthText.y = 8;
		add(healthText);
	}

	override public function update(elapsed:Float)
	{
		time -= elapsed;
		if (time <= 0)
		{
			time = 1;
			if (sprite.alive)
			{
				sprite.kill();
				healthText.text = "Dead";
			}
			else
			{
				sprite.revive();
				healthText.text = "Alive";
			}
		}
		super.update(elapsed);
	}
}
