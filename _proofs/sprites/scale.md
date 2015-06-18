---
title: Scale
concept: Sprites
order: 7
tags: [sprites, graphics]
complexity: 2
---
You can stretch and squash the graphic of a {% api flixel.FlxSprite %} by using it's {% api flixel.FlxSprite.scale %} property. 

Note: scale does <em>not</em> affect the sprite's dimensions or hitbox, only the graphic.

```haxe
// sprite will be scaled on the x-axis by 4
sprite.scale.x = 4;
```
