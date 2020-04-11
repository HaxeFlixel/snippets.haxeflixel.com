---
title: Basics
concept: Input
order: 1
complexity: 1
tags: [input, keyboard, basics, buttons]
---
{% api flixel.input.FlxInput %} is a general class used for multiple types of inputs: Keyboard, Mouse, Touch, and Buttons.

Each input has 4 states: `justPressed`, `pressed`, `justReleased`, and `released`.

```haxe
if (FlxG.keys.pressed.X)
{
	jump();
}
```
