---
title: Angle
concept: Tweens
complexity: 1
tags: [tweens]
order: 2
---

{% api flixel.tweens.FlxTween %} can be used to change values over time following a number of available curve functions.

Using {% api flixel.tweens.FlxTween.angle %} allows you to change the {% api flixel.FlxSprite.angle %} of a {% api flixel.FlxSprite %} over time.

```haxe
// create an angle tween
FlxTween.angle(myObject, fromAngle, toAngle, duration, {type: tweenType, easing: FlxEase: easeFunction});
```
