package;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.tile.FlxTileblock;
import flixel.tile.FlxTilemap;
import flixel.tweens.FlxTween;
import flixel.util.FlxAxes;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	override public function create()
	{
		bgColor = 0;

		var bg:FlxTileblock = new FlxTileblock(0, 0, FlxG.width * 2, FlxG.height);
		bg.loadTiles("assets/tiles.png", 16, 16, 4);
		bg.screenCenter();
		bg.scrollFactor.set(.33, .33);
		add(bg);

		var darkener:FlxSprite = new FlxSprite();
		darkener.makeGraphic(FlxG.width, FlxG.height, 0x33000000);
		darkener.scrollFactor.set();
		add(darkener);

		for (i in 0...Std.int((FlxG.width * 2) / 50))
		{
			var s:FlxSprite = new FlxSprite(5 + (i * 50), FlxG.height - 80, "assets/bigbox.png");
			s.scrollFactor.set(.66, .66);
			add(s);
		}

		var darkener:FlxSprite = new FlxSprite();
		darkener.makeGraphic(FlxG.width, FlxG.height, 0x33000000);
		darkener.scrollFactor.set();
		add(darkener);

		var wall:FlxTileblock = new FlxTileblock(0, FlxG.height - 72, FlxG.width * 2, 40);
		wall.loadTiles("assets/wall.png", 40, 40, 0);
		add(wall);

		var black:FlxSprite = new FlxSprite();
		black.makeGraphic(FlxG.width, 32, 0xFF000000);
		black.y = FlxG.height - 32;
		black.scrollFactor.set();
		add(black);

		var floor:FlxTileblock = new FlxTileblock(0, FlxG.height - 32, FlxG.width * 2, 32);
		floor.loadTiles("assets/tiles.png", 16, 16, 0);
		add(floor);

		var ball:FlxSprite = new FlxSprite(10, FlxG.height - 56, "assets/sprite.png");
		add(ball);

		var text:FlxText = new FlxText(10, 10, FlxG.width,
			"This Text could be a helpful HUD element.");
		text.color = 0xffffffff;
		text.size = 8;
		text.setBorderStyle(FlxTextBorderStyle.SHADOW, 0xFF000000);
		text.scrollFactor.set();
		add(text);

		FlxG.camera.setScrollBoundsRect(0, 0, FlxG.width * 2, FlxG.height, true);
		FlxG.camera.follow(ball, FlxCameraFollowStyle.LOCKON);

		FlxTween.linearMotion(ball, 10, ball.y, (FlxG.width * 2) - 34, ball.y, 5, true,
			{type: FlxTweenType.PINGPONG});

		super.create();
	}
}
