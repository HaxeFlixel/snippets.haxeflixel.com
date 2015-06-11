---
title: 1-to-1 Collision
concept: Collision
order: 1
tags: [collision]
seealso: [Movement/Velocity]
complexity: 1
---
The simplest form of collision is 1-to-1 collision. You call {% api FlxG.collide() %}, optionally setting a callback to trigger when collision happens.

```haxe
// checks if 2 objects collided, and calls the function `callback` if they do
FlxG.collide(objectA, objectB, callback);
```
