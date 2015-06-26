---
title: Adding
concept: Basics
complexity: 1
tags: [basics]
order: 2
seealso: [States, Groups]
---
A {% api flixel.FlxObject %} will not appear on the screen, until it has been added to the current {% api flixel.FlxState %} (or a child of the current state).

The order a {% api flixel.FlxObject %} is added determines their order within that object's members. Typically, each {% api flixel.FlxObject %} is drawn, and updated, depending on this order, with all the children of an object being updated/drawn when their parent is.

```haxe
// add object to the current state
add(object);
```
