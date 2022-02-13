---
title: Tilemap Collision
concept: Collision
order: 3
complexity: 1
---
Collision between a {% api flixel.tile.FlxTilemap %} and at least one {% api flixel.FlxObject %} is really simple. Just call {% api flixel.FlxG.collide() %}, passing the tilemap and the object(s), and flixel takes care of the rest.

```haxe
FlxG.collide(map, sprite);
```
