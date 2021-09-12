---
title: Facing
concept: Sprites
order: 6
tags: [sprites, graphics]
complexity: 1
---
{% api flixel.FlxSprite.facing %} can be used to help set/determine the orientation of a {% api flixel.FlxSprite %}. Combine this with {% api flixel.FlxSprite.setFacingFlip() %} to have your sprite graphic flip depending on the way it's facing.

```haxe
// set sprite's facing to RIGHT.
sprite.facing = RIGHT;

// whenever sprite is facing RIGHT, do NOT flip the sprite's graphic
sprite.setFacingFlip(RIGHT, false, false);

// whenever sprite is facing LEFT, flip the graphic horizontally
sprite.setFacingFlip(LEFT, true, false);
```
