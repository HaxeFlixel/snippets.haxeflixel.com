---
title: Button
concept: Input
order: 4
complexity: 1
tags: [input, button, mouse]
---
For a simple button use a {% api flixel.ui.FlxButton %}. You can call a function when clicked by the mouse.

```haxe
// create a button that calls onButtonClick when its clicked
button = new FlxButton(120, 110, "Click me", onButtonClicked);
```
