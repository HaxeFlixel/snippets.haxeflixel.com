---
title: Jumping
concept: Movement
order: 5
complexity: 2
seealso: [Collision, Movement/Velocity, Movement/Acceleration]
tags: [movement, jumping, game mechanic]
---
There are many ways to implement a jumping mechanic, but the simplest method is to add negative <var>y</var> {% api flixel.FlxObject.velocity %} temporarily to a {% api flixel.FlxObject %} with positive <var>y</var> {% api flixel.FlxObject.acceleration %}.


```haxe
// call super.update first, as it sets touching flags to NONE
super.update(elapsed);

// If sprite is resting on box it will set its touching to DOWN
FlxG.collide(box, sprite);

// jump if touching the box, and jump is pressed
if (sprite.isTouching(DOWN) && pad.getButton(A).pressed)
	sprite.velocity.y = -300;
```
