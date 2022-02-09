---
title: FlxSignal
concept: timing
order: 2
tags: [timing, flxsignal]
complexity: 2
---

You can use {% api flixel.util.FlxSignal %} to create a signal that can be triggered by anything.

Functions you {% api flixel.util.FlxSignal.add %} to your {% api flixel.util.FlxSignal %} will be called when the signal is triggered.

```haxe
// I want sprite1 and sprite2 to call each of their own functions on a certain condition
var sprite1 = new FlxSprite();
var sprite2 = new FlxSprite();

// FlxSignals can take parameters for data or none at all, and when you call `dispatch` it'll run each of its functions.
var signal = new FlxSignal();

// when the signal dispatches, it'll call the public functions from these sprites
signal.add(sprite1.publicFunction);
signal.add(sprite2.otherPublicFunction);

if (condition) {
  // both sprite1.publicFunction and sprite2.otherPublicFunction will both be called because of this dispatch
  signal.dispatch();
}
```
