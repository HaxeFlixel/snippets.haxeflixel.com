---
title: Distance
concept: Math
order: 2
tags: [distance, math, utilities]
complexity: 1
---

{% api flixel.math.FlxMath %} offers several helper functions check the distance between an object and a {$ flixel.math.FlxPoint %}, the mouse, a touch, or another object.

Use {% api flixel.math.FlxMath.distanceToMouse %},  {% api flixel.math.FlxMath.distanceToPoint %}, {% api flixel.math.FlxMath.distanceToTouch %}, and {% api flixel.math.FlxMath.distanceBetween %} to get the distance in pixels between your object and the relevant item.

```haxe
// get the distance between your target and a FlxPoint
distance = FlxVelocity.distanceToPoint(target, point);
```

<div class="alert alert-info"><i class="fa fa-paperclip" aria-hidden="true"></i> <strong> Note:</strong> Use the related `isDistanceTo*Within` functions if you just want to check if the distance is within a specific value. These functions avoid the expensive `Math.sqrt` call that is used in the other functions.</div>
