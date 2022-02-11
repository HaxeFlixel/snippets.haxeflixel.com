---
title: scrollFactor
concept: Camera
complexity: 2
order: 5
tags: [camera]
---

{% api flixel.FlxObject.scrollFactor %} is useful for changing the rate at which a {% api flixel.FlxObject %} moves in relation to the camera.

You can set the `x` and `y` scroll factors independently. A value of `1` means the object will move exactly as fast as the camera. A value of `0` means the object will not move at all as the camera scrolls.

```haxe
// set the scroll factor of an object
object.scrollFactor.set(0.5, 0.75);
```
