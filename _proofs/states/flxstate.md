---
title: FlxState
concept: States
complexity: 1
tags: [states]
order: 1
---

The {% api flixel.FlxState %} provides a segmented section of code that can be used to separate different parts of your game.

Only one FlxState can be loaded and active at a time. Override {% api flixel.FlxState.create %} to set up all the objects and pre-loaded content in your state, and {% api flixel.FlxState.destroy %} for cleanup.

States are typically used for menus, and different 'screens' of the game, but can be used for much more.

```haxe
// change the current state
FlxG.switchState(new MyState());
```
