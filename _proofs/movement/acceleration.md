---
title: Acceleration
concept: Movement
order: 2
tags: [movement, acceleration]
seealso: [Movement/Velocity, Movement/Gravity]
---
{% api Acceleration flixel/FlxObject acceleration %} is the amount of {% api Velocity flixel/FlxObject velocity %} to add to a {% api FlxObject flixel/FlxObject %} per second. This is used to increase or decrease the object's velocity over time.

```haxe
// object will accelerate from left to right 250 pixels per second
object.acceleration.x = 250;

// if the object starts at velocity.x = 0:
// at  .5 seconds, velocity.x = 125
// at 1   seconds, velocity.x = 250
// at 2   seconds, velocity.x = 500
// etc.
```
