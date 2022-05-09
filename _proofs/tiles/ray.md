---
title: Ray
concept: Tiles
order: 3
tags: [tiles, tileblock]
---

{% api flixel.tile.FlxTilemap.ray %} lets you check if a line between two points collides with any 'collidable' tiles in a {% api flixel.tile.FlxTilemap %}.

```haxe
var reachesDestination = tilemap.ray(startPoint, targetPoint, collidePoint);
```
