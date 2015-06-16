package;

import flixel.addons.effects.FlxGlitchSprite;
import flixel.addons.effects.FlxWaveSprite;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.tweens.FlxTween;
import openfl.geom.Point;

class PlayState extends FlxState
{
	
	private var sprites:Array<FlxSprite> = [];
	private var strText:String = "HaxeFlixel Mechanics";
	private var _glitch:FlxGlitchSprite;
	private var _wave:FlxWaveSprite;
	private var _timer:Float = 0;
	private var doingEffect:Bool = false;
	private var whichEffect:Int = -1;
	private var target:Int = -1;
	
	override public function create():Void
	{
		bgColor = 0;
		super.create();
		
		sprites.push(new FlxSprite(0, 0, AssetPaths.logo__png));
		
		var txt:FlxText;
		var spr:FlxSprite;
		var pt:Point = new Point();
		trace(strText.split(""));
		for (letter in strText.split(""))
		{
			txt = new FlxText(0, 0, 0, letter, 63, true);
			txt.color = 0xff000000;
			txt.font = "Ubuntu Medium";
			spr = new FlxSprite();
			spr.makeGraphic(Math.ceil(txt.width), Math.ceil(txt.height), 0x0, true, 'letter' + letter);
			spr.pixels.copyPixels(txt.pixels, txt.pixels.rect, pt);
			spr.dirty = true;
			sprites.push(spr);
		}
		for (sNo in 0...sprites.length)
		{
			if (sNo > 0)
				sprites[sNo].x = sprites[sNo - 1].x + sprites[sNo - 1].width - 3;
			else
				sprites[sNo].x = 4;
			sprites[sNo].y = FlxG.height - sprites[sNo].height - 4;
			add(sprites[sNo]);
		}
		
		_glitch = new FlxGlitchSprite(sprites[1], 0, 1, 0.05, FlxGlitchDirection.HORIZONTAL);
		add(_glitch);
		
		_wave = new FlxWaveSprite(sprites[2], FlxWaveMode.ALL, 0, -1, 3);
		add(_wave);
		
		
		
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		_timer += elapsed * .25;
		if (_timer > 1)
		{
			_timer = 0;
			
			if (doingEffect)
			{
				endEffect();
			}
			else
			{
				startEffect();
			}
		}
		
	}
	
	private function endEffect():Void
	{
		doingEffect = false;
		
		switch (whichEffect) 
		{
			case 0:
				FlxTween.num(5, 0, 1, { type:FlxTween.ONESHOT }, function(Value:Float) {
					_glitch.strength = Math.floor(Value);
				});
			case 1:
				FlxTween.num(5, 0, 1, { type:FlxTween.ONESHOT }, function(Value:Float) {
					_wave.strength = 4 * Math.floor(Value);
				});
			default:
				
		}
		
		whichEffect = -1;
		
	}
	
	private function startEffect():Void
	{
		doingEffect = true;
		whichEffect = FlxG.random.int(0, 1);
		switch (whichEffect) 
		{
			case 0:
				FlxTween.num(0, 5, 1, { type:FlxTween.ONESHOT }, function(Value:Float) {
					_glitch.strength = Math.floor(Value);
				});
			case 1:
				FlxTween.num(0, 5, 1, { type:FlxTween.ONESHOT }, function(Value:Float) {
					_wave.strength = 4 * Math.floor(Value);
				});
			default:
				
		}
	}
}
