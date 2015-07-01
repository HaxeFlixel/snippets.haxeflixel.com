package;

import flixel.FlxCamera.FlxCameraShakeDirection;
import flixel.FlxG;
import flixel.FlxState;
import flixel.tile.FlxTilemap;
using flixel.util.FlxSpriteUtil;

class PlayState extends FlxState
{
	
	private var timer:Float = 0;
	private var styleNo:Int = -1;
	private var style:FlxCameraShakeDirection;
	
	override public function create():Void
	{
		bgColor = 0;
		super.create();
		
		var map = new FlxTilemap();
		map.loadMapFromCSV(AssetPaths.map__csv, AssetPaths.tiles__png, 16, 16);
		map.screenCenter(true, true);
		add(map);
	}

	override public function update(elapsed:Float):Void
	{
		
		timer -= elapsed;
		if (timer <= 0)
		{
			timer = 2;
			styleNo++;
			if (styleNo >= 3)
				styleNo = 0;
			switch (styleNo) 
			{
				case 0:
					style = FlxCameraShakeDirection.BOTH_AXES;
				case 1:
					style = FlxCameraShakeDirection.X_AXIS;
				case 2:
					style = FlxCameraShakeDirection.Y_AXIS;
			}
			
			FlxG.camera.shake(0.05, 0.5, null, true, style);
		}
		
		super.update(elapsed);
	}
}
