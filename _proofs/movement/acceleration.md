---
title: Acceleration
concept: Movement
order: 2
tags: [movement, acceleration]
---
{% api Acceleration flixel/FlxObject acceleration %} is the amount of {% api Velocity flixel/FlxObject velocity %} to add to a {% api FlxObject flixel/FlxObject %} per second. This is used to increase or decrease the object's velocity over time.

```haxe
// object will accelerate from left to right 250 pixels per second
object.acceleration.x = 250;
```
