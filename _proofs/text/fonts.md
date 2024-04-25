---
title: Fonts
concept: Text
complexity: 1
order: 1
tags: [text]
seealso: [Sprites]
---
You can embed TTS fonts by including them in your assets, like so:
```xml
<assets path="assets/fonts" rename="fonts"/>
```

Once the font is embedded, you can use it via {% api flixel.text.FlxText.font %}, like so:
```haxe
text.font = "fonts/Arial Rounded Bold.ttf";
```

You can also specify system fonts via `text.font = "Arial";`, but know that not all devices may have your desired font installed, so it's usually recommended to include the font in the project's assets
