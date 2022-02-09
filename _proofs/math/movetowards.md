---
title: moveTowards
concept: Math
order: 1
tags: [movement, math, utilities]
complexity: 1
---

{% api flixel.math.FlxVelocity %} offers several helper functions to move objects towards the mouse, a certain point, a touch,  or another object.

Use {% api flixel.math.FlxVelocity.moveTowardsMouse %},  {% api flixel.math.FlxVelocity.moveTowardsPoint %}, {% api flixel.math.FlxVelocity.moveTowardsTouch %}, and {% api flixel.math.FlxVelocity.moveTowardsObject %} if you need a simple way to move an object around.

```haxe
// move `target` towards the mouse at `speed` pixels per second
FlxVelocity.moveTowardsMouse(target, speed);
```

<div class="alert alert-info"><span class="glyphicon glyphicon-paperclip"> </span> <strong> Note:</strong> There are similar `accelerateTowards*` functions that can be used as well.</div>
