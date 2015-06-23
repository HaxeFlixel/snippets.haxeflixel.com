---
title: Typed Group
concept: Groups
order: 2
complexity: 1
seealso: [Groups/Basic-Group]
tags: [groups]
---
Using a {% api flixel.groups.FlxTypedGroup %} will allow you to specify the class that will be contained in the group ({% api flixel.groups.FlxGroup %} is an alias for {% api flixel.groups.FlxTypedGroup %}<{% api flixel.FlxBasic %}>).

This can be very useful when passing group-members to functions without having to `cast` them.

```haxe
// create a FlxTypedGroup called group, speficying that is contains Sprite objects, and has a maximum of 10
var group = new FlxTypedGroup<Sprite>(10);
```
