---
title: tileProperties
concept: Tiles
order: 4
tags: [tiles, tileblock]
---

You can set unique properties of any tile in a {% api flixel.tile.FlxTilemap %}, using {% api flixel.tile.FlxTilemap.setTileProperties %}.

You can set which sides of the tile collide, and/or set callbacks.

```haxe
map.setTileMap(tileNo, collisionFlags, callback, filterClass, range);
```
