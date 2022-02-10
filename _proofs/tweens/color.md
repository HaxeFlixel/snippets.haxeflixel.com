---
title: Color
concept: Tweens
complexity: 1
tags: [tweens]
order: 3
---

{% api flixel.tweens.FlxTween %} can be used to change values over time following a number of available curve functions.

Using {% api flixel.tweens.FlxTween.color %} allows you to change the {% api flixel.FlxSprite.color %} of a {% api flixel.FlxSprite %} over time.

```haxe
// create a color tween
FlxTween.color(myObject, duration, fromColor, toColor, {type: tweenType, easing: FlxEase: easeFunction});
```
