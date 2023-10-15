---
title: Textfield size
concept: Text
complexity: 2
order: 2
tags: [text, size, autosize]
seealso: [Text/FlxText, Sprites]
---

By default {% api flixel.text.FlxText %} object is autosized - its height and width
are determined by its text content. You can control this behavior with such properties
as {% api flixel.text.FlxText.fieldWidth %}, {% api flixel.text.FlxText.fieldHeight %} and {% api flixel.text.FlxText.autoSize %}. **Note**: updating these properties triggers updating field's hitbox!

```haxe
// fixed width and height
text.fieldWidth = 100;
text.fieldHeight = 50;

// fixed width but auto height
text.fieldWidth = 100;
text.fieldHeight = -1;
```

If you want to make an autosized text explicitly:

```haxe
text.autoSize = true;
text.wordWrap = false; // must be explicitly set to `false`
// or
text.fieldWidth = text.fieldHeight = -1;
```
