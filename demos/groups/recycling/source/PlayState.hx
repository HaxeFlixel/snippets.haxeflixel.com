package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;

class PlayState extends FlxState
{
	private var group:FlxTypedGroup<Sprite>;
	private var spawnTimer:Float = 0;
	
	override public function create():Void
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

	override public function update(elapsed:Float):Void
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
