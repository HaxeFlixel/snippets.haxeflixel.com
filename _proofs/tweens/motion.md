---
title: Motion
concept: Tweens
complexity: 1
tags: [tweens]
order: 4
---

{% api flixel.tweens.FlxTween %} can be used to change values over time following a number of available curve functions.

There are multiple motion tween functions available, but they all work roughly the same way.

Using {% api flixel.tweens.FlxTween.color %} allows you to change the {% api flixel.FlxObject.x %} and {% api flixel.FlxObject.y %} values of a {% api flixel.FlxObject %} over time.

```haxe
// create a linear motion tween
FlxTween.linearMotion(myObject, fromX, fromY, toX, toY, duration, useDuration, {type: tweenType, easing: FlxEase: easeFunction});
```
