---
title: Pixel Perfect
concept: Overlap
order: 1
tags: [overlap]
complexity: 1
sourcefiles: source/PlayState.hx
---
Use {% api flixel.util.FlxCollision.pixelPerfectCheck() %} to check if any of pixels of a {% api flixel.FlxSprite %} overlaps the pixels of another {% api flixel.FlxSprite %}.

{% api flixel.util.FlxCollision.pixelPerfectCheck() %} will return `true` if it detects an overlap, and `false`. if it does not. this is true regardless of the sprite's hitbox, and works for any {% api flixel.FlxSprite.scale %}, {% api flixel.FlxObject.angle %} or even {% api flixel.FlxObject.scrollFactor %}

```haxe
// overlaps will be true if the two objects are overlapping each other
overlaps = FlxCollision.pixelPerfectCheck(spriteA, spriteB);
```
