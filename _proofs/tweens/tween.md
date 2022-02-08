---
title: Tween
concept: Tweens
complexity: 1
tags: [tweens]
order: 1
---

{% api flixel.tweens.FlxTween %} can be used to change values over time following a number of available curve functions.

Using {% api flixel.tweens.FlxTween.tween %} allows you to pass any kind of object, and several parameters that you want to tween over.

```haxe
// create a tween
FlxTween.tween(myObject, {parameter: destinationValue}, duration, {type: tweenType, easing: FlxEase: easeFunction});
```
