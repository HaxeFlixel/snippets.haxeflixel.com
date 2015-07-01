---
title: Flash
concept: Camera
complexity: 1
order: 1
tags: [camera, effects]
---
{% api flixel.FlxCamera %} contains a built-in {% api flixel.FlxCamera.flash() %} function which will fill the whole camera with a solid color that fades out over some time.

```haxe
// flash the screen red, and have it fade after 1 second
FlxG.camera.flash(FlxColor.RED, 1);
```
