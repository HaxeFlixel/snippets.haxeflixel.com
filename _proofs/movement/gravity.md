---
title: Gravity
concept: Movement
order: 4
tags: [movement, acceleration, gravity]
seealso: [Movement/Acceleration, Movement/MaxVelocity]
complexity: 1
---
Gravity can be simulated by setting the y {% api flixel.FlxObject.acceleration %} of a {% api flixel.FlxObject %}. You can even use {% api flixel.FlxObject.maxVelocity %} to set a 'terminal velocity'.

```haxe
// object will accelerate downwards by 400 pixels per second
object.acceleration.y = 400;
// object will not accelerate beyond 200 pixels per second
object.maxVelocity.y = 200;
```
