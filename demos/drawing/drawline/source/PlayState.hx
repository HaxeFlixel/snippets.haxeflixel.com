package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.tweens.FlxTween;
import flixel.util.FlxSpriteUtil;

class PlayState extends FlxState
{
    private var spriteleft:FlxSprite;
    private var spriteright:FlxSprite;
    private var line:FlxSprite;

    override public function create()
    {
        bgColor = 0;

        line = new FlxSprite();
        line.makeGraphic(FlxG.width, FlxG.height, 0, true);
        add(line);

        spriteleft = new FlxSprite(10, 10, "assets/sprite.png");
        add(spriteleft);

        spriteright = new FlxSprite(FlxG.width - 10 - spriteleft.width, FlxG.height - 10 - spriteleft.height, "assets/sprite.png");
        add(spriteright);

        FlxTween.linearMotion(spriteleft, 10, 10, 10, FlxG.height - 10 - spriteleft.height, 2, true, {type: FlxTweenType.PINGPONG});

        FlxTween.linearMotion(spriteright, FlxG.width - 10 - spriteright.width, FlxG.height - 10 - spriteright.height, FlxG.width - 10 - spriteright.width, 10, 2, true, {
            type: FlxTweenType.PINGPONG
        });

        super.create();
    }

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);

        FlxSpriteUtil.fill(line, 0);

        FlxSpriteUtil.drawLine(line, spriteleft.x + spriteleft.origin.x, spriteleft.y + spriteleft.origin.y, spriteright.x + spriteright.origin.x, spriteright.y + spriteright.origin.y, {
            thickness: 3,
            color: 0xFF00FF00
        });
    }
}
