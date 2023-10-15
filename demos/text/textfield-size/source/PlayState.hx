package;

import flixel.util.FlxColor;
import flixel.text.FlxText;
import flixel.FlxState;

class PlayState extends FlxState
{
	override public function create()
	{
		bgColor = 0;
		super.create();

		var fontSize = 16;

		var autoSizedText = new FlxText(0, 0, 0, "autosized", fontSize);
		autoSizedText.screenCenter(X);
		autoSizedText.y = 30;
		colorize(autoSizedText);
		add(autoSizedText);

		var fixedSize = new FlxText();
		fixedSize.fieldWidth = 120;
		fixedSize.fieldHeight = 50;
		fixedSize.text = "fixed size";
		fixedSize.size = fontSize;
		fixedSize.screenCenter(X);
		fixedSize.y = autoSizedText.getScreenBounds().bottom + 10;
		colorize(fixedSize);
		add(fixedSize);

		var autoHeight = new FlxText();
		autoHeight.fieldWidth = 100;
		autoHeight.fieldHeight = 0;
		autoHeight.text = 'fixed width\nauto height';
		autoHeight.size = fontSize;
		autoHeight.screenCenter(X);
		autoHeight.y = fixedSize.getScreenBounds().bottom + 10;
		colorize(autoHeight);
		add(autoHeight);
	}

	function colorize(text:FlxText)
	{
		text.color = FlxColor.CYAN;
		// accessing background through underlying openfl TextField object
		text.textField.background = true;
		text.textField.backgroundColor = 0x0C365F;
	}
}
