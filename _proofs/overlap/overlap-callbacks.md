---
title: Overlap Callbacks
concept: Overlap
order: 2
tags: [overlap]
complexity: 1
sourcefiles: source/PlayState.hx
seealso: [Overlap/Simple Overlap]
---
Callbacks add powerful functionality to the {% api flixel.FlxG.overlap() %} function. You can define two callbacks: `NotifyCallback` and `ProcessCallback`.

In the `ProcessCallback` function, you can do your own, custom checks to determine if your objects actually should trigger an overlap.

In the `NotifyCallback` function, you can specify what you want to happen when an overlap is detected.

```haxe
// if objectA overlaps objectB, doOverlapCheck will be called. If that returns true, then doOverlap will be called
FlxG.overlap(objectA, objectB, doOverlap, doOverlapCheck);

// doOverlapCheck will return true only if objectA is moving to the right when an overlap is detected
private function doOverlapCheck(objectA:FlxObject, objectB:FlxObject):Bool
{
  return objectA.velocity.x > 0;
}
```
