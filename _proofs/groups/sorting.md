---
title: Sorting
concept: Groups
complexity: 2
order: 4
tags: [groups]
---

By default, HaxeFlixel displays objects in a {% api flixel.group.FlxGroup %} in the order they were added.

Objects added first will be drawn 'behind' objects added later.

This is driven by the {% api flixel.group.FlxGroup.members %} property.

However, if you change the order of the objects in {% api flixel.group.FlxGroup.members %}, this will change the order the objects are drawn.

This is best demonstrated by using {% api flixel.group.FlxGroup.sort %} to easily sort the objects in the group.

You can achieve simple effects just by sorting, such as a top-down, layered visual style where objects with a higher `y` value can appear 'in front of' objects with a lower `y`.

```haxe
// sort the group by the `y` value of the objects
group.sort(FlxSort.byY);

// or make your own sorting function (this one sort by `y+height`)
group.sort((Order, Obj1, Obj2) ->
  {
   return FlxSort.byValues(Order, Obj1.y + Obj1.height, Obj2.y + Obj2.height);
  });
```
