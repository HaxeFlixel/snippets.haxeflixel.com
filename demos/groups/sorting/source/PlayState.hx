package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxSort;

class PlayState extends FlxState
{
	var sortGroup:FlxTypedGroup<FlxSprite>;

	override public function create()
	{
		bgColor = 0;

		add(sortGroup = new FlxTypedGroup<FlxSprite>());

		var x:Float = 0;
		var y:Float = 0;

		while (y <= FlxG.height - 40)
		{
			while (x <= FlxG.width - 40)
			{
				addBox(x, y);
				x += 40;
			}
			y += 40;
			x = 0;
		}

		for (i in 0...4)
		{
			addSprite(i);
		}

		super.create();
	}

	private function addSprite(Pos:Int):Void
	{
		var sprite:FlxSprite = sortGroup.add(new FlxSprite("assets/sprite.png"));
		FlxTween.circularMotion(sprite, (FlxG.width / 2)
			- (sprite.width / 2),
			(FlxG.height / 2)
			- (sprite.height / 2), (FlxG.width / 2)
			- 50
			- (Pos * 25), 359,
			Pos % 2 == 0, 5, true, {
				type: FlxTweenType.LOOPING
			});
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);

		sortGroup.sort((Order, Obj1, Obj2) ->
		{
			return FlxSort.byValues(Order, Obj1.y + Obj1.height, Obj2.y + Obj2.height);
		});
	}

	private function addBox(X:Float, Y:Float):Void
	{
		sortGroup.add(new FlxSprite(X, Y, "assets/wall.png"));
	}
}
