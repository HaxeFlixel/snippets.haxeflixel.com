package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.util.FlxDestroyUtil;
import flixel.util.FlxSpriteUtil;

class PlayState extends FlxState
{
	private var sprite:FlxSprite;

	override public function create()
	{
		sprite = new FlxSprite("assets/sprite.png");
		sprite.screenCenter();
		sprite.velocity.set(200, 200);
		add(sprite);

		var text = new FlxText();
		text.text = "I am the PlayState.";
		text.color = FlxColor.CYAN;
		text.size = 16;
		text.setBorderStyle(FlxTextBorderStyle.SHADOW, FlxColor.BLUE, 4);
		text.screenCenter();
		add(text);

		var button = new FlxButton(0, 0, "Open SubState", openSub);
		button.screenCenter();
		button.y = text.y + text.height + 16;
		add(button);

		bgColor = 0;

super.create();
	}

	private function openSub():Void
	{
		openSubState(new OtherState());
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);

		if (sprite.x < 0 || sprite.x > FlxG.width)
		{
			sprite.velocity.x *= -1;
		}
		if (sprite.y < 0 || sprite.y > FlxG.height)
		{
			sprite.velocity.y *= -1;
		}
	}
}

class OtherState extends FlxSubState
{
	public function new()
	{
		super(0x33000000);
	}

	override public function create()
	{
		var text = new FlxText();
		text.text = "I am the OtherState.";
		text.color = FlxColor.PINK;
		text.size = 16;
		text.setBorderStyle(FlxTextBorderStyle.SHADOW, FlxColor.RED, 4);
		text.screenCenter();

		var button = new FlxButton(0, 0, "Close SubState", closeSub);
		button.screenCenter();
		button.y = text.y + text.height + 16;

		var bg:FlxSprite = new FlxSprite();
		bg.makeGraphic(Std.int(text.width + 16), Std.int(text.height + button.height + 36),
			FlxColor.WHITE);
		FlxSpriteUtil.drawRect(bg, 1, 1, bg.width - 2, bg.height - 2, FlxColor.BLACK);
		bg.screenCenter();

		add(bg);
		add(text);
		add(button);

		bgColor = 0;

super.create();
	}

	private function closeSub():Void
	{
		close();
	}
}
