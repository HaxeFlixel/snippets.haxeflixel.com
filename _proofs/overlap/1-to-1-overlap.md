---
title: 1-to-1 Overlap
concept: Overlap
order: 1
tags: [overlap]
complexity: 1
---
One of the simplest ways to check for overlap is by {% api flixel.FlxObject.overlaps() %} which will simply return `true` if it detects and overlap, and `false` otherwise.
This function only looks at the objects' bounding boxes to determine if they overlap or not.

```haxe
// overlaps will be true if objectA overlaps objectB
overlaps = objectA.overlaps(objectB);
```
