---
title: Gamepad
concept: Input
order: 3
tags: [input, gamepad]
---
{% api flixel.FlxG.gamepads %} is an instance of {% api flixel.input.gamepad.FlxGamepadManager %} - a helper class that can track input from multiple gamepads. The last used gamepad can be `null` so it should be checked against to prevent errors.


```haxe
if (FlxG.gamepads.lastActive != null && FlxG.gamepads.lastActive.pressed.A)
{
	sprite.velocity.y = -100;
}
```
