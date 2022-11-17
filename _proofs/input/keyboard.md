---
title: Keyboard
concept: Input
order: 2
complexity: 1
tags: [input, keyboard]
---
{% api flixel.FlxG.keys %} is an instance of {% api flixel.input.keyboard.FlxKeyboard %} - a helper object that is used to track keyboard input.

```haxe
// Detect if the up arrow key is pressed
if (FlxG.keys.pressed.UP)
{
	sprite.velocity.y = -100;
}
```

It's also easy to detect a key press among various keys.

```haxe
// Detect if either the W key or the up arrow key is pressed
if (FlxG.keys.anyPressed([UP, W]))
{
	sprite.velocity.y = -100;
}
```
