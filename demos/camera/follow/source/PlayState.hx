package;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.tile.FlxTileblock;
import flixel.tile.FlxTilemap;
import flixel.util.FlxColor;
using flixel.util.FlxSpriteUtil;

class PlayState extends FlxState
{
	private var sprite:FlxSprite;
	private var back:FlxTileblock;
	private var walls:FlxTilemap;
	private var txtStatus:FlxText;
	
	private var timer:Float = 10;
	private var styleNo:Int = 0;
	private var currentStyle:FlxCameraFollowStyle = FlxCameraFollowStyle.LOCKON;
	
	override public function create():Void
	{
		bgColor = 0;
		super.create();
		
		back = new FlxTileblock(0, 0, FlxG.width * 2, FlxG.height * 2);
		back.loadTiles(AssetPaths.back_tile__png, 16, 16, 0);
		add(back);
		
		walls = new FlxTilemap();
		walls.loadMapFromCSV(AssetPaths.big_room_map__csv, AssetPaths.tiles__png, 16, 16);
		add(walls);
		
		sprite = new FlxSprite(AssetPaths.sprite__png);
		sprite.x = walls.width / 2 - sprite.width / 2;
		sprite.y = walls.height / 2 - sprite.height / 2;
		sprite.velocity.set(160, 160);
		sprite.elasticity = 1;
		add(sprite);
		
		txtStatus = new FlxText();
		txtStatus.size = 16;
		txtStatus.text = "LOCKON";
		txtStatus.autoSize = false;
		txtStatus.wordWrap = false;
		txtStatus.fieldWidth = FlxG.width;
		txtStatus.color = FlxColor.WHITE;
		txtStatus.setBorderStyle(FlxTextBorderStyle.SHADOW, FlxColor.BLACK, 2, 1);
		txtStatus.alignment = FlxTextAlign.CENTER;
		txtStatus.screenCenter(true, false);
		txtStatus.y = 8;
		txtStatus.scrollFactor.set();
		add(txtStatus);
		
		FlxG.camera.setScrollBoundsRect(0, 0, walls.width, walls.height, true);
		FlxG.camera.follow(sprite, currentStyle);
		
	}

	override public function update(elapsed:Float):Void
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
			txtStatus.text = Std.string(currentStyle);
			FlxG.camera.follow(sprite, currentStyle);
		}
		
		super.update(elapsed);
		
		FlxG.collide(walls, sprite);
		
	}
}
