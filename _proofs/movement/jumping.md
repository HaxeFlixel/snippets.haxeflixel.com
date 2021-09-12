---
title: Jumping
concept: Movement
order: 5
complexity: 2
seealso: [Collision, Movement/Velocity, Movement/Acceleration]
tags: [movement, jumping, game mechanic]
---
There are many ways to implement a jumping mechanic, but the simplest method is to add negative <var>y</var> {% api flixel.FlxObject.velocity %} temporarily to a {% api flixel.FlxObject %} with positive <var>y</var> {% api flixel.FlxObject.acceleration %}, using some kind of timer to limit the jump time.


```haxe
FlxG.collide(box, sprite);

var jumpPressed:Bool = pad.buttonA.pressed;

if (jumping && !jumpPressed)
	jumping = false;

// reset jumpTimer when touching the floor
if (sprite.isTouching(DOWN) && !jumping)
	jumpTimer = 0;

if (jumpTimer >= 0 && jumpPressed)
{
	jumping = true;
	jumpTimer += elapsed;
}
else
	jumpTimer = -1;

// hold button to jump higher (up to 0.25s)
if (jumpTimer > 0 && jumpTimer < 0.25)
	sprite.velocity.y = -300;
```
