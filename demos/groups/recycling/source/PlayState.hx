package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;

class PlayState extends FlxState
{
	var group:FlxTypedGroup<Sprite>;
	var spawnTimer:Float = 0;

	override public function create()
	{
		super.create();

		add(group = new FlxTypedGroup<Sprite>(20));
	}

	override public function update(elapsed:Float)
	{
		spawnTimer += elapsed * 5;
		if (spawnTimer > 1)
		{
			spawnTimer--;
			group.add(group.recycle(Sprite.new));
		}

		super.update(elapsed);
	}
}
