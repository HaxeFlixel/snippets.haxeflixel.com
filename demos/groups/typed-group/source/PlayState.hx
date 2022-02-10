package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;

class PlayState extends FlxState
{
	override public function create()
	{
		bgColor = 0;

super.create();

		var group = new FlxTypedGroup<Sprite>(10);
		add(group);

		for (i in 0...group.maxSize)
		{
			group.add(new Sprite());
		}
	}
}
