package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.math.FlxPoint;
import flixel.tile.FlxTilemap;
import flixel.tweens.FlxTween;
import flixel.util.FlxSpriteUtil;

class PlayState extends FlxState
{
	var map:FlxTilemap;

	var sprite:FlxSprite;

	override public function create()
	{
		bgColor = 0;

		add(map = new FlxTilemap());
		map.loadMapFromCSV("assets/tile-prop-map.csv", "assets/tile-props.png");
		map.screenCenter();

		map.setTileProperties(2, FlxObject.CEILING);
		map.setTileProperties(3, FlxObject.ANY, bounceUp);
		map.setTileProperties(4, FlxObject.ANY, bounceLeft);
		map.setTileProperties(5, FlxObject.ANY, bounceRight);

		add(sprite = new FlxSprite("assets/sprite.png"));
		sprite.x = 48;
		sprite.y = 24;
		sprite.offset.x = 10;
		sprite.offset.y = 2;
		sprite.width = 4;
		sprite.height = 20;

		sprite.acceleration.y = 500;
		sprite.velocity.x = 80;

		super.create();
	}

	private function bounceUp(Tile:FlxObject, Obj:FlxObject):Void
	{
		Obj.velocity.y = -250;
	}

	private function bounceLeft(Tile:FlxObject, Obj:FlxObject):Void
	{
		Obj.velocity.x = -80;
	}

	private function bounceRight(Tile:FlxObject, Obj:FlxObject):Void
	{
		Obj.velocity.x = 80;
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);

		FlxG.collide(sprite, map);
	}
}
