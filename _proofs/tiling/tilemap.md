---
title: Tilemap
concept: Tiling
order: 2
tags: [tiling, tilemap]
complexity: 1
---
Unlike {% api flixel.tile.FlxTileblock %}, {% api flixel.tile.FlxTilemap %} requires a defined map to be passed to it, which it uses to draw tiles from.

```haxe
tilemap.loadMapFrom2DArray(mapData, 'path/to/tiles.png');
```
