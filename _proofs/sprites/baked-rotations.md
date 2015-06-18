---
title: Baked Rotations
concept: Sprites
order: 8
tags: [sprites, graphics]
complexity: 2
seealso: [Movement/angle]
---
Using baked rotations is a great way to improve graphical performance when dealing with rotating sprites. Load your the graphic for your {% api flixel.FlxSprite %} by using {% api flixel.FlxSprite.loadRotatedGraphic() %}, and the system will generate a sprite sheet for your sprite that has frames for all of the possible angles. When you set the angle of a {% api flixel.FlxSprite %} which is using baked rotations, it will choose the frame(s) that are closest to your specified angle.

```haxe
// sprite's graphic will be baked using 16 rotations.
sprite.loadRotatedGraphic('path/to/image.png', 16);
```
