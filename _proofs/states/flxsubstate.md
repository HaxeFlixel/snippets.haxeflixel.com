---
title: FlxSubState
concept: States
complexity: 1
tags: [states]
order: 2
---

{% api flixel.FlxSubState %} is a special state that can be opened from within a {% api flixel.FlxState %} or another {% api flixel.FlxSubState %}.

When opened, a {% api flixel.FlxSubState %} will be displayed on top of all other states/substates, and only the top-most {% api flixel.FlxSubState %} will be responsive. By default, states below the top-most {% api flixel.FlxSubState %} will stop being updated, although you can change this behavior, if desired.

Use {% api flixel.FlxState.openSubState %} to open a {% api flixel.FlxSubState %}, and {% api flixel.FlxSubState.close %} to close it, giving control back to the parent {% api flixel.FlxState %} or {% api flixel.FlxSubState %}.

You can even define {% api flixel.FlxSubState.openCallback %} and/or {% api flixel.FlxSubState.closeCallback %} functions to be called when the {% api flixel.FlxSubState %} is opened or closed, respectively.

{% api flixel.FlxSubState %} is a versatile utility that can be used for in-game menus, pause screens, or other pop-up type screens.

```haxe
// open and display a new sub-state from withing a FlxState or FlxSubState
openSubState(new MySubState());
```
