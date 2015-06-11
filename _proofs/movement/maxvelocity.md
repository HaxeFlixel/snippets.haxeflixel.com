---
title: MaxVelocity
concept: Movement
order: 3
tags: [movement, velocity, acceleration, maxvelocity]
seealso: [Movement/Acceleration, Movement/Gravity]
complexity: 1
---
Use {% api flixel.FlxObject.maxVelocity %} to limit the {% api flixel.FlxObject.velocity %} of a {% api flixel.FlxObject %}. Very useful when using {% api flixel.FlxObject.acceleration %} to 'cap' the object's speed.

```haxe
// object's x velocity will stay between -100 and +100
object.maxVelocity.x = 100;
```
