package;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.tile.FlxTileblock;
import flixel.tile.FlxTilemap;
import flixel.util.FlxAxes;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	var sprite:FlxSprite;
	var back:FlxTileblock;
	var walls:FlxTilemap;
	var statusText:FlxText;

	var timer:Float = 10;
	var styleNo:Int = 0;
	var currentStyle:FlxCameraFollowStyle = FlxCameraFollowStyle.LOCKON;

	override public function create()
	{
		bgColor = 0;

		super.create();

		back = new FlxTileblock(0, 0, FlxG.width * 2, FlxG.height * 2);
		back.loadTiles("assets/back-tile.png", 16, 16, 0);
		add(back);

		walls = new FlxTilemap();
		walls.loadMapFromCSV("assets/big-room-map.csv", "assets/tiles.png", 16, 16);
		add(walls);

		sprite = new FlxSprite("assets/sprite.png");
		sprite.x = walls.width / 2 - sprite.width / 2;
		sprite.y = walls.height / 2 - sprite.height / 2;
		sprite.velocity.set(160, 160);
		sprite.elasticity = 1;
		add(sprite);

		statusText = new FlxText();
		statusText.size = 16;
		statusText.text = "LOCKON";
		statusText.autoSize = false;
		statusText.wordWrap = false;
		statusText.fieldWidth = FlxG.width;
		statusText.color = FlxColor.BLACK;
		statusText.setBorderStyle(FlxTextBorderStyle.SHADOW, FlxColor.GRAY, 2, 1);
		statusText.alignment = FlxTextAlign.CENTER;
		statusText.screenCenter(FlxAxes.X);
		statusText.y = 8;
		statusText.scrollFactor.set();
		add(statusText);

		FlxG.camera.setScrollBoundsRect(0, 0, walls.width, walls.height, true);
		FlxG.camera.follow(sprite, currentStyle);
	}

	override public function update(elapsed:Float)
	{
		timer -= elapsed;
		if (timer <= 0)
		{
			timer = 10;
			styleNo++;
			if (styleNo >= 6)
				styleNo = 0;
			switch (styleNo)
			{
				case 0:
					currentStyle = FlxCameraFollowStyle.LOCKON;
				case 1:
					currentStyle = FlxCameraFollowStyle.NO_DEAD_ZONE;
				case 2:
					currentStyle = FlxCameraFollowStyle.PLATFORMER;
				case 3:
					currentStyle = FlxCameraFollowStyle.SCREEN_BY_SCREEN;
				case 4:
					currentStyle = FlxCameraFollowStyle.TOPDOWN;
				case 5:
					currentStyle = FlxCameraFollowStyle.TOPDOWN_TIGHT;
			}
			statusText.text = Std.string(currentStyle);
			FlxG.camera.follow(sprite, currentStyle);
		}

		super.update(elapsed);

		FlxG.collide(walls, sprite);
	}
}
