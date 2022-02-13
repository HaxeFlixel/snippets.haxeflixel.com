package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.math.FlxPoint;
import flixel.tile.FlxTilemap;
import flixel.tweens.FlxTween;
import flixel.util.FlxSpriteUtil;

class PlayState extends FlxState
{
	var map:FlxTilemap;

	var center:FlxSprite;

	var target:FlxSprite;

	var endPoint:FlxPoint;

	var line:FlxSprite;

	override public function create()
	{
		bgColor = 0;

		add(map = new FlxTilemap());
		map.loadMapFromCSV("assets/ray-map.csv", "assets/tiles.png");
		map.screenCenter();

		add(center = new FlxSprite("assets/sprite.png"));
		center.offset.x = center.offset.y = 12;
		center.centerOrigin();
		center.screenCenter();

		add(target = new FlxSprite("assets/sprite.png"));
		target.offset.x = target.offset.y = 12;
		target.centerOrigin();

		add(line = new FlxSprite());
		line.makeGraphic(FlxG.width, FlxG.height, 0);

		endPoint = FlxPoint.get();

		FlxTween.circularMotion(target, FlxG.width / 2, FlxG.height / 2, FlxG.width / 2.8, 0,
			false, 4, true, {
				type: FlxTweenType.LOOPING
			});

		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);

		var madeIt:Bool = map.ray(center.getMidpoint(), target.getMidpoint(), endPoint, 4);

		FlxSpriteUtil.fill(line, 0);
		if (madeIt)
			FlxSpriteUtil.drawLine(line, center.x, center.y, target.x, target.y,
				{thickness: 3, color: 0xFF00FF00});
		else
			FlxSpriteUtil.drawLine(line, center.x, center.y, endPoint.x, endPoint.y,
				{thickness: 3, color: 0xFFFF0000});
	}
}
