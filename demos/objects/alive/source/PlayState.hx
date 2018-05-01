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
	var txtHealth:FlxText;
	
	var time:Float=1;
	
	override public function create():Void
	{
		bgColor = 0;
		super.create();
		
		sprite = new FlxSprite(AssetPaths.sprite__png);
		sprite.screenCenter();
		add(sprite);
		
		txtHealth = new FlxText();
		txtHealth.size = 16;
		txtHealth.text = "Alive";
		txtHealth.autoSize = false;
		txtHealth.wordWrap = false;
		txtHealth.fieldWidth = FlxG.width;
		txtHealth.color = FlxColor.WHITE;
		txtHealth.setBorderStyle(FlxTextBorderStyle.SHADOW, FlxColor.BLACK, 2, 1);
		txtHealth.alignment = FlxTextAlign.CENTER;
		txtHealth.screenCenter(FlxAxes.X);
		txtHealth.y = 8;
		add(txtHealth);
	}

	override public function update(elapsed:Float):Void
	{
		time -= elapsed;
		if (time <= 0)
		{
			time = 1;
			if (sprite.alive)
			{
				sprite.kill();
				txtHealth.text = "Dead";
			}
			else
			{
				sprite.revive();
				txtHealth.text = "Alive";
			}
			
		}
		super.update(elapsed);
	}
}
