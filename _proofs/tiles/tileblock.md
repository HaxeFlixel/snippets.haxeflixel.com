---
title: Tileblock
concept: Tiles
order: 1
tags: [tiles, tileblock]
complexity: 1
---
{% api flixel.tile.FlxTileblock %} is a quick and simple way to make rectangular, tiled objects. It randomly places tiles out of the assigned tilesheet. You can also specify to include 'empty' tiles, which will leave more gaps in the finished block.

```haxe
tileblock.loadMap('path/to/tiles.png', 16, 16, 1);
```
