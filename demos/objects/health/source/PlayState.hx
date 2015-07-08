package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	private var sprite:FlxSprite;
	
	private var txtHealth:FlxText;
	
	override public function create():Void
	{
		bgColor = 0;
		super.create();
		
		sprite = new FlxSprite(AssetPaths.sprite__png);
		sprite.screenCenter(true, true);
		add(sprite);
		
		sprite.health = 5;
		
		txtHealth = new FlxText();
		txtHealth.size = 16;
		txtHealth.text = "Health: 5";
		txtHealth.autoSize = false;
		txtHealth.wordWrap = false;
		txtHealth.fieldWidth = FlxG.width;
		txtHealth.color = FlxColor.WHITE;
		txtHealth.setBorderStyle(FlxTextBorderStyle.SHADOW, FlxColor.BLACK, 2, 1);
		txtHealth.alignment = FlxTextAlign.CENTER;
		txtHealth.screenCenter(true, false);
		txtHealth.y = 8;
		add(txtHealth);
		
	}

	override public function update(elapsed:Float):Void
	{
		
		if (sprite.health < -1)
		{
			sprite.health = 5;
			sprite.revive();
		}
		else 
			sprite.hurt(elapsed);
		if (sprite.health > 0)
			txtHealth.text = "Health: " + Std.string(Math.ceil(sprite.health));
		else
			txtHealth.text = "DEAD!";
		
		super.update(elapsed);
	}
}
