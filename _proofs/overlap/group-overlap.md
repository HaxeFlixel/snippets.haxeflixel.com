---
title: Group Overlap
concept: Overlap
order: 1
tags: [overlap]
complexity: 1
sourcefiles: source/PlayState.hx
seealso: [Collision/1-to-1-collision]
---
{% api flixel.FlxG.overlap() %} not only works between 2 {% api flixel.FlxObject %}s, but you can also pass in a {% api flixel.group.FlxGroup %} to either arg.

{% api flixel.FlxG.overlap() %} will still return whether it detected any overlap between the groups, but it is usually wise to use a `notifyCallback` to handle each specific overlap.

## Performance
{% api flixel.FlxG.overlap() %} uses quadtrees on groups to greatly reduce the number of comparisons between objects, meaning that a single call with 2 groups can perform immensely better than checking whether each pair of objects overlaps, individually.

```haxe
function handleCollision(objA:FlxObject, objB:FlxObject)
{
    trace('overlap between a: $objA and b:$objB');
}

// check if any objects in groupA overlap any objects in groupB
FlxG.overlap(groupA, groupB, handleCollision);
// check if the player overlaps anything in groupB
FlxG.overlap(player, groupB, handleCollision);
// Chech if any objects in groupA overlap each other
FlxG.overlap(groupA, groupA, handleCollision);
```
