package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;

class PlayState extends FlxState
{
	private var group:FlxTypedGroup<MyClass>;
	
	override public function create():Void
	{
		bgColor = 0;
		super.create();
		
		group = new FlxTypedGroup<MyClass>(10);
		add(group);
		
		for (i in 0...group.maxSize)
		{
			group.add(new MyClass());
		}
		
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
