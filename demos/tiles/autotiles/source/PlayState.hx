package;

import flixel.FlxState;
import flixel.text.FlxText;
import flixel.tile.FlxBaseTilemap.FlxTilemapAutoTiling;
import flixel.tile.FlxTilemap;

class PlayState extends FlxState
{
	var map_auto:FlxTilemap;
	var map_alt:FlxTilemap;
	var map_full:FlxTilemap;

	override public function create()
	{
		bgColor = 0;

		map_auto = new FlxTilemap();
		map_auto.loadMapFromCSV("assets/room-map.csv", "assets/autotiles.png", 8, 8,
			FlxTilemapAutoTiling.AUTO);
		add(map_auto);

		map_alt = new FlxTilemap();
		map_alt.loadMapFromCSV("assets/room-map-alt.csv", "assets/autotiles_alt.png", 8, 8,
			FlxTilemapAutoTiling.ALT);
		map_alt.x = map_auto.width;
		add(map_alt);

		map_full = new FlxTilemap();
		map_full.loadMapFromCSV("assets/room-map-full.csv", "assets/autotiles_full.png", 8, 8,
			FlxTilemapAutoTiling.FULL);
		map_full.y = map_auto.height;
		add(map_full);

		var text:FlxText = new FlxText(0, 0, 0, "AUTO");
		text.size = 16;
		text.color = 0xFF28288e;
		text.alignment = FlxTextAlign.CENTER;
		text.setBorderStyle(FlxTextBorderStyle.SHADOW, 0xffc9c9e6);
		text.x = map_auto.x + (map_auto.width / 2) - (text.width / 2);
		text.y = map_auto.y + (map_auto.height / 2) - (text.height / 2);
		add(text);

		text = new FlxText(0, 0, 0, "ALT");
		text.size = 16;
		text.color = 0xFFa3e6b4;
		text.alignment = FlxTextAlign.CENTER;
		text.setBorderStyle(FlxTextBorderStyle.SHADOW, 0xff1a4324);
		text.x = map_alt.x + (map_alt.width / 2) - (text.width / 2);
		text.y = map_alt.y + (map_alt.height / 2) - (text.height / 2);
		add(text);

		text = new FlxText(0, 0, 0, "FULL");
		text.size = 16;
		text.color = 0xFF3c341a;
		text.alignment = FlxTextAlign.CENTER;
		text.setBorderStyle(FlxTextBorderStyle.SHADOW, 0xffe6cd84);
		text.x = map_full.x + (map_full.width / 2) - (text.width / 2);
		text.y = map_full.y + (map_full.height / 2) - (text.height / 2);
		add(text);

		super.create();
	}
}
