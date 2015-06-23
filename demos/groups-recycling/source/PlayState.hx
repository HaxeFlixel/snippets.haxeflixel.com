package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;

class PlayState extends FlxState
{
	private var group:FlxTypedGroup<MyClass>;
	private var spawnTimer:Float = 0;
	
	override public function create():Void
	{
		bgColor = 0;
		super.create();
		
		group = new FlxTypedGroup<MyClass>(20);
		for (i in 0...group.maxSize)
		{
			group.add(new MyClass());
		}
		add(group);
	}

	override public function update(elapsed:Float):Void
	{
		spawnTimer += elapsed * 5;
		if (spawnTimer > 1)
		{
			spawnTimer--;
			var sprite:MyClass = group.recycle();
			group.add(sprite);
		}
		
		super.update(elapsed);
	}
}
