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
		bgColor = 0;
		super.create();
		
		group = new FlxTypedGroup<Sprite>(20);
		for (i in 0...group.maxSize)
		{
			group.add(new Sprite());
		}
		add(group);
	}

	override public function update(elapsed:Float)
	{
		spawnTimer += elapsed * 5;
		if (spawnTimer > 1)
		{
			spawnTimer--;
			group.add(group.recycle());
		}
		
		super.update(elapsed);
	}
}
