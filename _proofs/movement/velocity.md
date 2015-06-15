---
title: Velocity
concept: Movement
order: 1
tags: [movement, velocity]
complexity: 1
sourcefiles: source/PlayState.hx source/Main.hx
---
Set {% api flixel.FlxObject.velocity %} on a {% api flixel.FlxObject %} to make it move at a constant rate, in pixels per second.

```haxe
// object will move from left to right at 50 pixels per second
object.velocity.x = 50;
```
