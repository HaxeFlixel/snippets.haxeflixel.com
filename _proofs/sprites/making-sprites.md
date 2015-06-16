---
title: Making Sprites
concept: Sprites
order: 1
tags: [sprites, graphics]
complexity: 1
seealso: [Utils/FlxColor]
---
Use {% api flixel.FlxSprite.makeGraphic() %} to create a {% api flixel.FlxSprite %} of a solid color.

```haxe
// sprite's graphic will be made into a 128px by 64px solid red rectangle
sprite.makeGraphic(128, 64, FlxColor.RED);
```
