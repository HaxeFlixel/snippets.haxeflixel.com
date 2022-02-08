---
title: Num
concept: Tweens
complexity: 1
tags: [tweens]
order: 5
---

{% api flixel.tweens.FlxTween %} can be used to change values over time following a number of available curve functions.

Using {% api flixel.tweens.FlxTween.num %} allows you to change a numerical value over time, and pass the value to a function to use however you want.

```haxe
// create a numeric tween
FlxTween.num(fromValue, toValue, duration, {type: tweenType, easing: FlxEase: easeFunction}, updateFunction);

private function updateFunction(Value:Float):Void
{
    // do something with the value
    console.log(Value);
}
```
