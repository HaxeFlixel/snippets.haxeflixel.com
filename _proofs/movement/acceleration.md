---
title: Acceleration
concept: Movement
order: 2
tags: [movement, acceleration]
seealso: [Movement/Velocity, Movement/Gravity]
complexity: 1
---
Use {% api acceleration flixel/FlxObject acceleration %} to change the {% api velocity flixel/FlxObject velocity %} of a {% api FlxObject flixel/FlxObject %} over time.

```haxe
// object will accelerate from left to right 250 pixels per second
object.acceleration.x = 250;

// if the object starts at velocity.x = 0:
// at  .5 seconds, velocity.x = 125
// at 1   seconds, velocity.x = 250
// at 2   seconds, velocity.x = 500
// etc.
```
