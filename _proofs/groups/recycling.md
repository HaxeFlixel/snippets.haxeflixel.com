---
title: Recycling
concept: Groups
complexity: 2
order: 3
tags: [groups]
---
One of the more powerful aspects of {% api flixel.groups.FlxGroup %} is the ability to {% api flixel.groups.FlxGroup.recycle() %} objects.

```haxe
// set sprite to the next object in the group FlxGroup, which will have revive called on it, automatically
sprite = group.recycle();
```

This is very useful for things like bullets, particles, enemy spawns, etc, where you don't want to call `new()` frequently.

<div class="alert alert-info"><span class="glyphicon glyphicon-paperclip"> </span> <strong> Note:</strong> {% api flixel.groups.FlxGroup.recycle() %} will act differently depending on if your {% api flixel.groups.FlxGroup %} has a {% api flixel.groups.FlxGroup.maxSize %} defined or not.</div>
