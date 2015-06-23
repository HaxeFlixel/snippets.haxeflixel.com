---
title: Typed Group
concept: Groups
order: 2
complexity: 1
seealso: [Groups/Basic-Group]
tags: [groups]
---
Using a {% api flixel.groups.FlxTypedGroup %} will allow you to specify the class that will be contained in the group ({% api flixel.groups.FlxGroup %} is a type of {% api flixel.groups.FlxTypedGroup %} that defaults to containing {% api flixel.FlxBasic %}).

This can be very useful when passing group-members to functions without having to `cast` them.

```haxe
// create a FlxTypedGroup called group, speficying that is contains the class MyClass, and has a maximum of 10
var group:FlxTypedGroup<MyClass> = new FlxTypedGroup<MyClass>(10);
```
