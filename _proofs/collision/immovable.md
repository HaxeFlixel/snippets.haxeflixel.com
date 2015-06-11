---
title: Immovable
concept: Collision
order: 2
seealso: [Collision/1-to-1 Collision]
tags: [collision]
---
When a {% api FlxObject flixel/FlxObject %}, it will push the object is collided with, unless that object is set to be {% api immovable flixel/FlxObject immovable %}.

```haxe
// the object will not be 'pushed' if another object collides with it
object.immovable = true;
```
