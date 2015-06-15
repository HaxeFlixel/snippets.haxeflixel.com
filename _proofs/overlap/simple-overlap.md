---
title: Simple Overlap
concept: Overlap
order: 1
tags: [overlap]
complexity: 1
sourcefiles: source/PlayState.hx
seealso: [Collision/1-to-1-collision]
---
Use {% api flixel.FlxG.overlap() %} to check if the bounding box of a {% api flixel.FlxObject %} (or any objects in a group) overlaps the bounding box of another {% api flixel.FlxObject %} (or any objects in the same or another group).

{% api flixel.FlxG.overlap() %} will return `true` if it detects an overlap, and `false`. if it does not.

```haxe
// overlaps will be true if the two objects are overlapping each other
overlaps = FlxG.overlap(objectA, objectB);
```
