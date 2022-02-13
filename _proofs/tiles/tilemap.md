---
title: Tilemap
concept: Tiles
order: 2
tags: [tiles, tilemap]
complexity: 1
sourcefiles: source/PlayState.hx ../../demo-assets/map.csv
---
Unlike {% api flixel.tile.FlxTileblock %}, {% api flixel.tile.FlxTilemap %} requires a defined map to be passed to it, which it uses to draw tiles from.

```haxe
tilemap.loadMapFromCSV('path/to/map.csv', 'path/to/tiles.png');
```
