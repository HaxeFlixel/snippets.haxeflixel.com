---
title: Health
concept: Objects
complexity: 1
tags: [objects]
order: 2
seealso: [Objects/Alive]
---
{% api flixel.FlxObject %} has a built-in {% api flixel.FlxObject.health %} property which can be used for tracking and object's health. If you use {% api flixel.FlxObject.hurt() %} and cause the object's health to reach `0`, it will call {% api flixel.FlxObject.kill() %} on the object.

```haxe
// set object's health to 5
object.health = 5;

// hurt the object for 2
object.hurt(2);
```
