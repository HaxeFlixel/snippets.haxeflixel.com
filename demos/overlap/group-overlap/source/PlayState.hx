package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;

class PlayState extends FlxState
{
	var circles:FlxTypedGroup<FlxSprite>;
	var boxes:FlxTypedGroup<FlxSprite>;
	
	override function create()
	{
		super.create();
		
		// make a 5x5 grid of boxes
		boxes = new FlxTypedGroup();
		add(boxes);
		for (x in 0...5)
		{
			for (y in 0...5)
			{
				final box = new FlxSprite("assets/bigbox.png");
				box.screenCenter();
				box.x += (x - 2) * (box.width + 20);
				box.y += (y - 2) * (box.height + 10);
				boxes.add(box);
			}
		}
		
		// make 3 circles in the center and send them in different directions
		circles = new FlxTypedGroup();
		add(circles);
		final numCircles = 3;
		for (i in 0...numCircles)
		{
			final circle = new FlxSprite("assets/sprite.png");
			circle.screenCenter();
			circle.velocity.setPolarDegrees(100, 15 + (360 * i / numCircles));
			circles.add(circle);
		}
	}
	
	override function update(elapsed:Float)
	{
		super.update(elapsed);
		
		for (circle in circles)
		{
			// change direction when touching the edge of the screen
			if ((circle.velocity.x > 0 && circle.x >= FlxG.width - circle.width) || (circle.velocity.x < 0 && circle.x <= 0))
			{
				circle.velocity.x *= -1;
			}
			
			if ((circle.velocity.y > 0 && circle.y >= FlxG.height - circle.height) || (circle.velocity.y < 0 && circle.y <= 0))
			{
				circle.velocity.y *= -1;
			}
		}
		
		// set all boxes' alphas to 1.0
		for (i => box in boxes)
		{
			box.alpha = 1.0;
		}
		
		// if any boxes overlap circles, set their alpha to 0.5 via the callback
		FlxG.overlap(circles, boxes, function(circle:FlxSprite, box:FlxSprite)
		{
			box.alpha = 0.5;
		});
	}
}
