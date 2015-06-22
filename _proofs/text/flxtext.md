---
title: FlxText
concept: Text
complexity: 1
order: 1
tags: [text]
seealso: [Sprites]
---
The most basic object to display text is a {% api flixel.text.FlxText %}. You can easily set properties such as {% api flixel.text.FlxText.text %}, {% api flixel.text.FlxText.color %}, {% api flixel.text.FlxText.alignment %} and more. It is an extension of {% api flixel.FlxSprite %}, which means, you can do a lot of the same things with it.

```haxe
// create a new FlxText
text = new FlxText();
text.text = "Hello, World!";          // set text's text to say "Hello, World!"
text.color = FlxColor.CYAN;          // set the color to cyan
text.size = 32;                       // set the text's size to 32px
text.alignment = FlxTextAlign.CENTER; // center the text
text.setBorderStyle(FlxTextBorderStyle.SHADOW, FlxColor.BLUE, 4);   // give the text a 4-pixel deep, blue shadow
```
