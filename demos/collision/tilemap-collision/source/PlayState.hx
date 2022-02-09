package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.tile.FlxTilemap;

class PlayState extends FlxState
{
	var map:FlxTilemap;
	var sprite:FlxSprite;

	override public function create()
	{
		bgColor = 0;

super.create();

		map = new FlxTilemap();
		map.loadMapFromCSV("assets/room-map.csv", "assets/tiles.png", 16, 16);
		add(map);

		sprite = new FlxSprite("assets/sprite.png");
		sprite.screenCenter();
		sprite.velocity.set(200, 200);
		sprite.elasticity = 1;
		add(sprite);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		FlxG.collide(map, sprite);
	}
}
