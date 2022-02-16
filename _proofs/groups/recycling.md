---
title: Recycling
concept: Groups
complexity: 2
order: 3
tags: [groups]
sourcefiles: source/PlayState.hx source/Sprite.hx
---
One of the more powerful aspects of groups is {% api flixel.group.FlxTypedGroup.recycle() %}.

```haxe
// revive the next dead object in the group,
// or create a new one if we haven't reached maxSize
sprite = group.recycle(Sprite.new);
```

This is very useful for things like bullets, particles, enemy spawns, etc, where you don't want to call `new()` frequently.

<div class="alert alert-info"><i class="fa fa-paperclip" aria-hidden="true"></i> <strong> Note:</strong> {% api flixel.group.FlxTypedGroup.recycle() %} will act differently depending on if the group has a {% api flixel.group.FlxTypedGroup.maxSize %} defined or not.</div>
