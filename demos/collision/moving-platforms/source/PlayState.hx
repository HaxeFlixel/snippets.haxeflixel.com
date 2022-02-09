package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.tile.FlxTilemap;
import flixel.ui.FlxVirtualPad;
import flixel.util.FlxAxes;

class PlayState extends FlxState
{
	var map:FlxTilemap;
	var platform:FlxSprite;
	var sprite:FlxSprite;
	var pad:FlxVirtualPad;

	override public function create()
	{
		bgColor = 0;

super.create();

		map = new FlxTilemap();
		map.loadMapFromCSV("assets/platform.csv", "assets/tiles.png", 16, 16);
		add(map);

		platform = new FlxSprite();
		platform.loadGraphic("assets/bigbox.png");
		platform.velocity.set(100, 0);
		platform.immovable = true;
		platform.screenCenter(FlxAxes.X);
		platform.y = 16 * 8;
		add(platform);

		sprite = new FlxSprite();
		sprite.loadGraphic("assets/sprite.png");
		resetSprite();
		sprite.acceleration.y = 600;
		add(sprite);

		pad = new FlxVirtualPad(FlxDPadMode.LEFT_RIGHT, FlxActionMode.NONE);
		add(pad);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (map.overlaps(platform))
			platform.velocity.x *= -1;
		FlxG.collide(map, sprite);

		FlxG.collide(platform, sprite);

		if (sprite.y >= FlxG.height - (16 * 3))
			resetSprite();

		var left:Bool = pad.buttonLeft.pressed || FlxG.keys.anyPressed([A, LEFT]);
		var right:Bool = pad.buttonRight.pressed || FlxG.keys.anyPressed([D, RIGHT]);

		if (left && right)
			left = right = false;
		if (left)
			sprite.velocity.x = -100;
		else if (right)
			sprite.velocity.x = 100;
		else
			sprite.velocity.x = 0;
	}

	function resetSprite()
	{
		sprite.x = platform.x + (platform.width / 2) - (sprite.width / 2);
		sprite.y = platform.y - sprite.height;
	}
}
