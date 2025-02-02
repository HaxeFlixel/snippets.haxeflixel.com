---
title: Variable Jumping
concept: Movement
order: 5
complexity: 2
seealso: [Collision, Movement/Velocity, Movement/Jumping]
tags: [movement, jumping, game mechanic]
---
A more advanced jumping technique is to allow the object to jump higher if the button held, there's multiple ways to achieve this, but one common way it maintain the jump velocity for a brief time, so long as the button is held.

```haxe
// call super.update first, as it sets touching flags to NONE
super.update(elapsed);

// If sprite is resting on box it will set its touching to DOWN
FlxG.collide(box, sprite);

// Reset jumpTimer when touching the floor and jump is pressed
if (sprite.isTouching(DOWN) && pad.getButton(A).justPressed)
{
	jumpTimer = 0;
}

// hold button to jump higher (up to 0.25s)
if (pad.getButton(A).pressed)
{
	jumpTimer += elapsed;
	
	if (jumpTimer < 0.25)
	{
		sprite.velocity.y = -300;
	}
}
else
{
	// stop jumping after they release
	jumpTimer = 0.25;
}
```
