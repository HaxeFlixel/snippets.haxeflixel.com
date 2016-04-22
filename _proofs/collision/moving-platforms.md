---
title: Moving Platforms
concept: Collision
order: 4
complexity: 4
tags: [collision, platform, moving-platform, complex]
---
{% api flixel.group.FlxGroup %} is a way to separate, and layer {% api flixel.FlxObject %}s. This can be useful to 'force' your objects' draw-order, or to help with overlap/collision detection, etc. You can optionally limit the number of objects a group can hold.

```haxe
// create a FlxGroup called group, limiting it to 50 objects
var group:FlxGroup = new FlxGroup(50);

// add sprite to group
group.add(sprite);
```
