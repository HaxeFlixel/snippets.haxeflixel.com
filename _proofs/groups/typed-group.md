---
title: Typed Group
concept: Groups
order: 2
complexity: 1
seealso: [Groups/Basic-Group]
tags: [groups]
---
Using a {% api flixel.group.FlxTypedGroup %} will allow you to specify the class that will be contained in the group ({% api flixel.group.FlxGroup %} is an alias for {% api flixel.group.FlxTypedGroup %}&lt;{% api flixel.FlxBasic %}&gt;).

This can be very useful when passing group-members to functions without having to `cast` them.

```haxe
// create a FlxTypedGroup called group, specifying that is contains Sprite objects, and has a maximum of 10
var group = new FlxTypedGroup<Sprite>(10);
```
