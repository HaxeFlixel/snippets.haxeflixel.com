---
title: Immovable
concept: Collision
order: 2
seealso: [Collision/1-to-1 Collision]
tags: [collision]
complexity: 1
---
When a {% api flixel/.FlxObject %} collides, it will push the object it collided with, unless that object is set to be {% api flixel.FlxObject.immovable %}.

```haxe
// the object will not be 'pushed' if another object collides with it
object.immovable = true;
```
