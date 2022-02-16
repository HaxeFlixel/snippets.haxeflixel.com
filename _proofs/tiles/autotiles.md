---
title: Autotiles
concept: Tiles
order: 5
tags: [tiles, tileblock]
---

{% api flixel.tile.FlxTilemap %} has a built-in autotile system, which allows you to easily create tilemaps with repeating tiles.

There are 3 'flavors' of autotiling available:

{% api flixel.tile.FlxBaseTilemap.FlxTilemapAutoTiling.AUTO %} is best for 'thin' walls and maps with lots of open space.

<figure class="figure">
    <img src="/demos/demo-assets/autotiles.png" class="figure-img" alt="Autotiles">
    <figcaption class="figure-caption">This image contains 16 8x8 pixel tiles in the layout used for {% api flixel.tile.FlxBaseTilemap.FlxTilemapAutoTiling.AUTO %}.</figcaption>
</figure>

{% api flixel.tile.FlxBaseTilemap.FlxTilemapAutoTiling.ALT %} is best for 'thick' walls and maps with lots of walls with smaller, internal spaces.

<figure class="figure">
    <img src="/demos/demo-assets/autotiles_alt.png" class="figure-img" alt="Autotiles Alt">
    <figcaption class="figure-caption">This image contains 16 8x8 pixel tiles in the layout used for {% api flixel.tile.FlxBaseTilemap.FlxTilemapAutoTiling.ALT %}.</figcaption>
</figure>

{% api flixel.tile.FlxBaseTilemap.FlxTilemapAutoTiling.FULL %} is best for is the 'best of both worlds' and should handle both types of maps.

<figure class="figure">
    <img src="/demos/demo-assets/autotiles_full.png" class="figure-img" alt="Autotiles Full">
    <figcaption class="figure-caption">This image contains 48 8x8 pixel tiles in the layout used for {% api flixel.tile.FlxBaseTilemap.FlxTilemapAutoTiling.FULL %}.</figcaption>
</figure>

Why not just always use {% api flixel.tile.FlxBaseTilemap.FlxTilemapAutoTiling.FULL %}? Your individual project may not need to do all 48 tile configurations, so sticking with just {% api flixel.tile.FlxBaseTilemap.FlxTilemapAutoTiling.AUTO %} or {% api flixel.tile.FlxBaseTilemap.FlxTilemapAutoTiling.ALT %} may cut down on the number of tiles you need to draw.

<div class="alert alert-info"><i class="fa fa-paperclip" aria-hidden="true"></i> <strong> Note:</strong> You can use {% api flixel.tile.FlxBaseTilemap.customTileRemap %} to build your own auto-tiling map logic. This is especially useful if you want to use something like {% api flixel.addons.tile.FileTilemapExt %} to do slopes, as an example.</div>

```haxe
map.loadMapFromCSV(mapData, tilesImage, tileWidth, tileHeight, FlxTilemapAutoTiling.AUTO);
```
