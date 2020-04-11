---
title: FlxBitmapText
concept: Text
complexity: 2
order: 2
seealso: [Text/FlxText]
---
You can use Bitmap Fonts with the {% api flixel.text.FlxBitmapText %} object. You have to create and pass a {% api flixel.graphics.frames.FlxBitmapFont %}, which you can create in a number of different ways, such as [AngelCode](https://www.angelcode.com/products/bmfont/).

```haxe
// creates a new FlxBitmapText, using a monospace 8x8px font.
text = new FlxBitmapText(FlxBitmapFont.fromMonospace("assets/tiny-font.png",
	FlxBitmapFont.DEFAULT_CHARS, FlxPoint.get(8, 8)));

// set the text's text to "Hello, World!"
text.text = "Hello, World!";
```
