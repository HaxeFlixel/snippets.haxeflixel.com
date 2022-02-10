---
title: Callbacks
concept: Tweens
complexity: 2
tags: [tweens]
order: 6
---

{% api flixel.tweens.FlxTween %} can be used to change values over time following a number of available curve functions.

You can pass {% api flixel.tweens.FlxTween.TweenOptions %} to any {% api flixel.tweens.FlxTween %}, which can include an {% api flixel.tweens.FlxTween.TweenOptions.onStart %} and/or an {% api flixel.tweens.FlxTween.TweenOptions.onComplete %} callback.

Using these callbacks, you can trigger code to run when the tween starts, or when it completes.

```haxe
// create a linear motion tween
FlxTween.linearMotion(myObject, fromX, fromY, toX, toY, duration, useDuration, {type: tweenType, easing: FlxEase: easeFunction, onStart: myStartCallback, onComplete: myCompleteCallback});
```
