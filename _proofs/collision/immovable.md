---
title: Immovable
concept: Collision
order: 2
---
When a {% api FlxObject flixel/FlxObject %}, it will push the object is collided with, unless that object is set to be {% api immovable flixel/FlxObject.html immovable %}.

```haxe
// the object will not be 'pushed' if another object collides with it
object.immovable = true;
```
