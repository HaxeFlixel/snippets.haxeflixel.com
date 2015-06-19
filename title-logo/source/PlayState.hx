package;

import flixel.addons.effects.FlxGlitchSprite;
import flixel.addons.effects.FlxOutline;
import flixel.addons.effects.FlxRainbowSprite;
import flixel.addons.effects.FlxWaveSprite;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxDestroyUtil;
import openfl.geom.Point;

class PlayState extends FlxState
{
	
	private var sprites:Array<FlxSprite> = [];
	private var strText:String = "HaxeFlixel Mechanics";
	private var _glitch:FlxGlitchSprite;
	private var _wave:FlxWaveSprite;
	private var _timer:Float = -4;
	private var _color:FlxRainbowSprite;
	private var doingEffect:Bool = false;
	private var whichEffect:Int = -1;
	private var target:Int = -1;
	private var baseline:Float = -1;
	private var fullRainbow:FlxTypedGroup<FlxRainbowSprite>;
	
	override public function create():Void
	{
		bgColor = 0;
		super.create();
		
		sprites.push(new FlxSprite(0, 0, AssetPaths.logo__png));
		
		var txt:FlxText;
		var spr:FlxSprite;
		var pt:Point = new Point();
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
			{
				sprites[sNo].x = sprites[sNo - 1].x + sprites[sNo - 1].width - 3;
				if (sNo == 1)
					sprites[sNo].x += 8;
			}
			else
			{
				sprites[sNo].x = 8;
			}
			sprites[sNo].y = FlxG.height - sprites[sNo].height - 4;
			

			add(sprites[sNo]);
		}
		sprites[0].y -= 4;
		fullRainbow = new FlxTypedGroup<FlxRainbowSprite>();
		add(fullRainbow);
	}

	override public function update(elapsed:Float):Void
	{
		_timer += elapsed;
		if (_timer > 4)
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
		
		if (baseline > -1)
		{
			if (sprites[target].y + sprites[target].height > baseline)
			{
				sprites[target].velocity.y *= -.66;
				if (Math.abs(sprites[target].velocity.y) < 32)
				{
					sprites[target].velocity.y = 0;
					sprites[target].acceleration.y = 0;
					
				}
				sprites[target].y = baseline - sprites[target].height;
			}
		}
		
		super.update(elapsed);
		
		
	}
	
	private function endEffect():Void
	{
		doingEffect = false;
		
		switch (whichEffect) 
		{
			case 0:
				endGlitch();
			case 1:
				endWave();
			case 2:
				endRainbow();
			case 3:
				endJump();
			case 4:
				endFullRainbow();
			default:
				
		}
		
	}
	
	private function startEffect():Void
	{
		doingEffect = true;
		whichEffect = FlxG.random.int(0, 5, [whichEffect]);
		target = FlxG.random.int(0, sprites.length - 1, [target]);
		switch (whichEffect) 
		{
			case 0:
				startGlitch();
			case 1:
				startWave();
			case 2:
				startRainbow();
			case 3:
				startJump();
			case 4:
				startFullRainbow();
			default:
				
		}
	}
	
	private function startFullRainbow():Void
	{
		var totals:Int = sprites.length;
		var eachAmt:Int = Std.int(360 / totals);
		var amt:Int = 0;
		var c:FlxRainbowSprite;
		for (s in 0...sprites.length)
		{
			c = new FlxRainbowSprite(sprites[s], amt);
			fullRainbow.add(c);
			c.alpha = 0;
			amt += eachAmt;
		}
		FlxTween.num(0, 1, 1, { type:FlxTween.ONESHOT }, function(Value:Float) {
			for (c in fullRainbow.members)
				c.alpha = Value;
			//for (s in sprites)
			//	s.alpha = 1 - Value;
		});
	}
	
	private function endFullRainbow():Void
	{		
		FlxTween.num(1, 0, 1, { type:FlxTween.ONESHOT, onComplete:function(_){
			for (c in fullRainbow.members)
			{
				c.kill();
				fullRainbow.remove(c);
				c = FlxDestroyUtil.destroy(c);
			}
		}}, function(Value:Float) {
			for (c in fullRainbow.members)
				c.alpha = Value;
			//for (s in sprites)
			//	s.alpha = 1 - Value;
		});
	}
	
	private function endJump():Void
	{
		sprites[target].velocity.y = 0;
		sprites[target].acceleration.y = 0;
		sprites[target].y = baseline - sprites[target].height;
	}
	
	private function startJump():Void
	{
		baseline = sprites[target].y+sprites[target].height;
		sprites[target].acceleration.y = 1600;
		sprites[target].velocity.y = -300;
		
	}
	
	private function startRainbow():Void
	{
		_color = new FlxRainbowSprite(sprites[target]);
		_color.alpha = 0;
		add(_color);
		FlxTween.num(0, 1, .25, { type:FlxTween.ONESHOT }, function(Value:Float) {
			_color.alpha = Value;
			//sprites[target].alpha = 1 - Value;
		});
	}
	
	private function endRainbow():Void
	{
		FlxTween.num(1, 0, 0.25, { type:FlxTween.ONESHOT, onComplete: function(_) {
			_color.kill();
			remove(_color);
			_color = FlxDestroyUtil.destroy(_color);
		}}, function(Value:Float) {
			_color.alpha = Value;
			//sprites[target].alpha = 1 - Value;
		});
	}
	
	private function startWave():Void
	{
		sprites[target].visible = false;
		_wave = new FlxWaveSprite(sprites[target], FlxWaveMode.ALL, 0, -1, 3);
		add(_wave);
		_wave.visible = true;
		FlxTween.num(0, 5, 1, { type:FlxTween.ONESHOT }, function(Value:Float) {
			_wave.strength = 4 * Math.floor(Value);
		});
	}
	
	private function endWave():Void
	{
		FlxTween.num(5, 0, 1, { type:FlxTween.ONESHOT, onComplete: function(_) {
			_wave.visible = false;
			sprites[target].visible = true;
			_wave.kill();
			remove(_wave);
			_wave = FlxDestroyUtil.destroy(_wave);
		}}, function(Value:Float) {
			_wave.strength = 4 * Math.floor(Value);
		});
	}
	
	private function startGlitch():Void
	{
		sprites[target].visible = false;
		_glitch = new FlxGlitchSprite(sprites[target], 0, 1, 0.05, FlxGlitchDirection.HORIZONTAL);
		add(_glitch);
		FlxTween.num(0, 2, .5, { type:FlxTween.ONESHOT }, function(Value:Float) {
			_glitch.strength = Math.floor(Value);
		});
	}
	
	private function endGlitch():Void
	{
		FlxTween.num(2, 0, .5, { type:FlxTween.ONESHOT, onComplete: function(_) {
			_glitch.visible = false;
			sprites[target].visible = true;
			_glitch.kill();
			remove(_glitch);
			_glitch = FlxDestroyUtil.destroy(_glitch);
		}}, function(Value:Float) {
			_glitch.strength = Math.floor(Value);
		});
	}
	
}
