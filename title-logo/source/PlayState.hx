package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.effects.chainable.FlxEffectSprite;
import flixel.addons.effects.chainable.FlxGlitchEffect;
import flixel.addons.effects.chainable.FlxRainbowEffect;
import flixel.addons.effects.chainable.FlxWaveEffect;
import flixel.addons.effects.chainable.IFlxEffect;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.tweens.FlxTween;
import flixel.util.FlxDestroyUtil;
import openfl.geom.Point;

class PlayState extends FlxState
{
	var sprites:Array<FlxSprite> = [];
	var strText:String = "HaxeFlixel Snippets";
	var _glitchSprite:FlxEffectSprite;
	var _glitchEffect:FlxGlitchEffect;
	var _waveSprite:FlxEffectSprite;
	var _waveEffect:FlxWaveEffect;
	var _timer:Float = -4;
	var _colorSprite:FlxEffectSprite;
	var _colorEffect:FlxRainbowEffect;
	var doingEffect:Bool = false;
	var whichEffect:Int = -1;
	var target:Int = -1;
	var baseline:Float = -1;
	var fullRainbow:FlxTypedGroup<FlxEffectSprite>;

	override public function create()
	{
		bgColor = 0;
		bgColor = 0;

		super.create();

		sprites.push(new FlxSprite(0, 0, AssetPaths.logo__png));

		var text:FlxText;
		var spr:FlxSprite;
		var pt:Point = new Point();
		for (letter in strText.split(""))
		{
			text = new FlxText(0, 0, 0, letter, 63, true);
			text.color = 0xff000000;
			text.font = "Ubuntu Medium";
			spr = new FlxSprite();
			spr.makeGraphic(Math.ceil(text.width), Math.ceil(text.height), 0x0, true,
				'letter' + letter);
			spr.pixels.copyPixels(text.pixels, text.pixels.rect, pt);
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
		fullRainbow = new FlxTypedGroup<FlxEffectSprite>();
		add(fullRainbow);
	}

	override public function update(elapsed:Float)
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
				sprites[target].velocity.y *= -0.66;
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

	function endEffect()
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

	function startEffect()
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

	function startFullRainbow()
	{
		var totals:Int = sprites.length;
		var eachAmt:Int = Std.int(360 / totals);
		var amt:Int = 0;
		var c:FlxEffectSprite;
		for (s in 0...sprites.length)
		{
			var effect = new FlxRainbowEffect(amt);
			c = createEffectSprite(sprites[s], [effect]);
			fullRainbow.add(c);
			c.alpha = 0;
			amt += eachAmt;
		}
		FlxTween.num(0, 1, 1, null, function(Value:Float)
		{
			for (c in fullRainbow.members)
				c.alpha = Value;
			// for (s in sprites)
			//	s.alpha = 1 - Value;
		});
	}

	function endFullRainbow()
	{
		FlxTween.num(1, 0, 1, {
			onComplete: function(_)
			{
				for (c in fullRainbow.members)
				{
					c.kill();
					fullRainbow.remove(c);
					c = FlxDestroyUtil.destroy(c);
				}
			}
		}, function(Value:Float)
		{
			for (c in fullRainbow.members)
				c.alpha = Value;
			// for (s in sprites)
			//	s.alpha = 1 - Value;
		});
	}

	function endJump()
	{
		sprites[target].velocity.y = 0;
		sprites[target].acceleration.y = 0;
		sprites[target].y = baseline - sprites[target].height;
	}

	function startJump()
	{
		baseline = sprites[target].y + sprites[target].height;
		sprites[target].acceleration.y = 1600;
		sprites[target].velocity.y = -300;
	}

	function startRainbow()
	{
		_colorEffect = new FlxRainbowEffect();
		_colorSprite = createEffectSprite(sprites[target], [_colorEffect]);
		_colorSprite.alpha = 0;
		add(_colorSprite);
		FlxTween.num(0, 1, 0.25, null, function(Value:Float)
		{
			_colorSprite.alpha = Value;
			// sprites[target].alpha = 1 - Value;
		});
	}

	function endRainbow()
	{
		FlxTween.num(1, 0, 0.25, {
			onComplete: function(_)
			{
				_colorSprite.kill();
				remove(_colorSprite);
				_colorSprite = FlxDestroyUtil.destroy(_colorSprite);
			}
		}, function(Value:Float)
		{
			_colorSprite.alpha = Value;
			// sprites[target].alpha = 1 - Value;
		});
	}

	function startWave()
	{
		sprites[target].visible = false;
		_waveEffect = new FlxWaveEffect(FlxWaveMode.ALL, 0, -1, 3);
		_waveSprite = createEffectSprite(sprites[target], [_waveEffect]);
		add(_waveSprite);
		_waveSprite.visible = true;
		FlxTween.num(0, 5, 1, null, function(Value:Float)
		{
			_waveEffect.strength = 4 * Math.floor(Value);
		});
	}

	function endWave()
	{
		FlxTween.num(5, 0, 1, {
			onComplete: function(_)
			{
				_waveSprite.visible = false;
				sprites[target].visible = true;
				_waveSprite.kill();
				remove(_waveSprite);
				_waveSprite = FlxDestroyUtil.destroy(_waveSprite);
			}
		}, function(Value:Float)
		{
			_waveEffect.strength = 4 * Math.floor(Value);
		});
	}

	function startGlitch()
	{
		sprites[target].visible = false;
		_glitchEffect = new FlxGlitchEffect(0, 1, 0.05, FlxGlitchDirection.HORIZONTAL);
		_glitchSprite = createEffectSprite(sprites[target], [_glitchEffect]);
		add(_glitchSprite);
		FlxTween.num(0, 2, 0.5, null, function(Value:Float)
		{
			_glitchEffect.strength = Math.floor(Value);
		});
	}

	function endGlitch()
	{
		FlxTween.num(2, 0, 0.5, {
			onComplete: function(_)
			{
				_glitchSprite.visible = false;
				sprites[target].visible = true;
				_glitchSprite.kill();
				remove(_glitchSprite);
				_glitchSprite = FlxDestroyUtil.destroy(_glitchSprite);
			}
		}, function(Value:Float)
		{
			_glitchEffect.strength = Math.floor(Value);
		});
	}

	function createEffectSprite(target:FlxSprite, effects:Array<IFlxEffect>):FlxEffectSprite
	{
		var sprite = new FlxEffectSprite(target, effects);
		sprite.setPosition(target.x, target.y);
		return sprite;
	}
}
