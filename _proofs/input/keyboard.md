---
title: Keyboard
concept: Input
order: 2
complexity: 1
tags: [input, keyboard]
---
{% api flixel.FlxG.keys %} is an instance of {% api flixel.input.keyboard.FlxKeyboard %} - a helper object that is used to track keyboard input.


```haxe
if (FlxG.keys.anyPressed([UP]))
{
	sprite.velocity.y = -100;
}
```
