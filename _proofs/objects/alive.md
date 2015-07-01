---
title: Alive
concept: Objects
order: 1
complexity: 1
tags: [objects]
---
HaxeFlixel objects use an {% api flixel.FlxBasic.alive %} flag to easily set/determine how they should act. Dead (`alive == false`) objects do not have `update()` called on them, by default.
You can use {% api flixel.FlxBasic.kill() %} to set {% api flixel.FlxBasic.alive %} and {% api flixel.FlxBasic.exists %} to `false` simultaneously, and {% api flixel.FlxBasic.revive() %} to set them to `true`.

```haxe
// kill object
object.kill();

// revive object
object.revive();
```
