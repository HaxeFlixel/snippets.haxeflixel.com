---
title: MaxVelocity
concept: Movement
order: 3
tags: [movement, velocity, acceleration, maxvelocity]
seealso: [Movement/Acceleration, Movement/Gravity]
---
{% api MaxVelocity flixel/FlxObject maxVelocity %} is used to limit the {% api velocity flixel/FlxObject velocity %} of a {% api FlxObject flixel/FlxObject %}. Very useful when using {% api acceleration flixel/FlxAcceleration acceleration %} to 'cap' the object's speed.

```haxe
// object's x velocity will stay between -100 and +100
object.maxVelocity.x = 100;
```
