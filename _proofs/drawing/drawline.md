---
title: drawLine
concept: Drawing
order: 1
tags: [drawing, drawLine]
---

{% api flixel.util.FlxSpriteUtil %} has several drawing functions that can be used to draw onto a {% api flixel.FlxSprite %}.

Use {% api flixel.util.FlxSpriteUtil.drawLine %} to draw a line between two points.

```haxe
FlxSpriteUtil.drawLine(lineSprite, startX, startY, endX, endY, lineStyle);
```

<div class="alert alert-info"><i class="fa fa-paperclip" aria-hidden="true"></i> <strong> Note:</strong> {% api flixel.util.FlxSpriteUtil.lineStyle %} is a `typedef` with several properties that define how your drawn lines are going to look. It is used for all of the drawing functions, and has the following properties:
</div>

```haxe
typedef LineStyle =
{
 ?thickness:Float,          // Indicates the thickness of the line in points; valid values are 0-255. 0 = hairline
 ?color:FlxColor,           // the color of the line
 ?pixelHinting:Bool,        // When `true`, line widths are adjusted to full pixel widths. With pixelHinting set to false, disjoints can appear for curves and straight lines. 
 ?scaleMode:LineScaleMode,  // Specifies what scale mode to use: NORMAL, NONE, VERTICAL, or HORIZONTAL. Affects how the line is drawn when the object is scaled (scaleX and scaleY).
 ?capsStyle:CapsStyle,      // Specifies the type of caps at the end of lines. Valid values are: NONE, ROUND, and SQUARE
 ?jointStyle:JointStyle,    // Specifies the type of joint appearance used at angles. Valid values are: BEVEL, ROUND, and MITER.
 ?miterLimit:Float          // When jointStyle is set to MITER, this value (1-255) determine how long the miter can extend beyond the point where the lines meet. The default value is 3.
}
```
