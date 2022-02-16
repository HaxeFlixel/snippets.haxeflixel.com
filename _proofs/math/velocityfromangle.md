---
title: velocityFromAngle
concept: Math
order: 3
tags: [movement, math, utilities]
complexity: 2
---

{% api flixel.math.FlxVelocity.velocityFromAngle %} will return a {% api flixel.math.FlxPoint %} with the x and y velocity based on an angle and a speed.

Set an object's velocity to these values to move that object (or use it for something else)

```haxe
// determine the velocity based on angle and speed
velocity = FlxVelocity.velocityFromAngle(angle, speed);
```

<div class="alert alert-info"><i class="fa fa-paperclip" aria-hidden="true"></i> <strong> Note:</strong> There is a simlar {% api flixel.math.FlxVelocity.accelerateFromAngle %} function that will actually move an {% api flixel.FlxSprite %} based on an angle, acceleration, and maxSpeed.</div>
