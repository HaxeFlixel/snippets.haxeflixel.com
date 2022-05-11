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

	var hitPoint:FlxPoint;

	var line:FlxSprite;

	var tween:FlxTween;

	override public function create()
	{
		bgColor = 0;

		FlxG.mouse.useSystemCursor = true;

		add(map = new FlxTilemap());
		map.loadMapFromCSV("assets/ray-map.csv", "assets/tiles.png");
		map.screenCenter();

		add(center = new FlxSprite("assets/sprite.png"));
		center.offset.copyFrom(center.origin);
		center.screenCenter();

		add(target = new FlxSprite("assets/sprite.png"));
		target.offset.copyFrom(target.origin);

		add(line = new FlxSprite());
		line.makeGraphic(FlxG.width, FlxG.height, 0);

		hitPoint = FlxPoint.get();

		tween = FlxTween.circularMotion(target, center.x, center.y, FlxG.height / 2, 0, false, 4,
			true, {
				type: FlxTweenType.LOOPING
			});

		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);

		updateInput();

		var reachedTarget:Bool = map.ray(center.getPosition(), target.getPosition(), hitPoint);

		FlxSpriteUtil.fill(line, 0);
		if (reachedTarget)
		{
			FlxSpriteUtil.drawLine(line, center.x, center.y, target.x, target.y,
				{thickness: 3, color: 0xFF00FF00});
		}
		else
		{
			FlxSpriteUtil.drawLine(line, center.x, center.y, hitPoint.x, hitPoint.y,
				{thickness: 3, color: 0xFFFF0000});
		}
	}

	function updateInput()
	{
		// disable tween while user drags the target
		if (FlxG.mouse.pressed)
		{
			tween.active = false;
			// drag target
			target.x = FlxG.mouse.x;
			target.y = FlxG.mouse.y;
		}
		else
			tween.active = true;
	}
}
