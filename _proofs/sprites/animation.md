---
title: Animation
concept: Sprites
order: 3
tags: [sprites, graphics, animation]
complexity: 1
---
When loading a graphic for a {% api flixel.FlxSprite %}, you can specify is as an animated graphic. Then, using {% api flixel.FlxSprite.animation %}, you can setup animations and play them.

```haxe
// sprite's graphic will be loaded from 'path/to/image.png' and is set to allow animations.
sprite.loadGraphic('path/to/image/png', true);

// add an animation named 'run' to sprite, using the specified frames
sprite.animation.add('run', [0, 1, 2, 1]);

// play the 'run' animation
sprite.animation.play('run');
```

In the Demonstration, we are loading this image:
<figure class="figure">
    <img src="/demos/demo-assets/anim-sprite.png" class="figure-img" alt="Animated Sprite">
    <figcaption class="figure-caption">This image contains 7 frames of animation for a 24x24 pixel sprite.</figcaption>
</figure>
