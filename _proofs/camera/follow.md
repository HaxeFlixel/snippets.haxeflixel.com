---
title: Follow
concept: Camera
complexity: 2
order: 4
tags: [camera]
---
You can set a {% api flixel.FlxCamera %} to follow a {% api flxel.FlxObject %}. This will allow your camera to scroll as the object moves.

There are 6 built-in styles for {% api flixel.FlxCamera.FlxCameraFollowStyle %}, although you are free to set your own {% api flixel.FlxCamera.deadzone %}, if you wish.

```haxe
// tell the camera to follow sprite with the LOCKON style
FlxG.camera.follow(sprite, FlxCameraFollowStyle.LOCKON);
```
