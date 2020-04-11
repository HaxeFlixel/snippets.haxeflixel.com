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

if (jumped && !jumpPressed)
	jumped = false;

if (sprite.isTouching(FlxObject.DOWN) && !jumped)
	jump = 0;

if (jump >= 0 && jumpPressed)
{
	jumped = true;
	jump += elapsed;
	if (jump > 0.33)
		jump = -1;
}
else
	jump = -1;

if (jump > 0)
{
	if (jump < 0.065)
		sprite.velocity.y = -360;
	else
		sprite.acceleration.y = 10;
}
else
{
	sprite.velocity.y = 600;
}
```
