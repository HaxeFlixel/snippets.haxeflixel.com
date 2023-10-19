package;

import flixel.FlxG;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.text.FlxText;
import flixel.FlxState;

class PlayState extends FlxState
{
	override public function create()
	{
		super.create();

		bgColor = 0;

		var fontSize = 18;
		var xCoord = 10;
		var yCoord = 20;
		var gap = 10;

		var autoSized = new FlxText(xCoord, yCoord, 0, "autosized", fontSize);
		colorizeText(autoSized);
		add(autoSized);

		var fixedSize = new FlxText(xCoord);
		fixedSize.fieldWidth = 140;
		fixedSize.fieldHeight = 50;
		fixedSize.text = "fixed size";
		fixedSize.size = fontSize;
		fixedSize.y = autoSized.y + autoSized.height + gap;
		colorizeText(fixedSize);
		add(fixedSize);

		var autoHeight = new FlxText(xCoord);
		autoHeight.fieldWidth = 150;
		autoHeight.fieldHeight = 0;
		autoHeight.text = 'fixed width\nauto height';
		autoHeight.size = fontSize;
		autoHeight.y = fixedSize.y + fixedSize.height + gap;
		colorizeText(autoHeight);
		add(autoHeight);

		var sf = 1.5;
		var btn = new FlxButton(0, 0, () ->
		{
			var addon = 'Description: ';
			updateText(autoSized, addon);
			updateText(fixedSize, addon);
			updateText(autoHeight, addon);
		});
		btn.text = 'Update Text';
		btn.scale.scale(sf);
		btn.updateHitbox();
		btn.label.scale.scale(sf);
		btn.label.updateHitbox();
		btn.x = FlxG.width - btn.width - 10;
		btn.y = FlxG.height - btn.height - 10;
		add(btn);
	}

	function colorizeText(text:FlxText)
	{
		text.color = FlxColor.CYAN;
		// accessing background through underlying openfl TextField object
		text.textField.background = true;
		text.textField.backgroundColor = 0x0C365F;
	}

	function updateText(textField:FlxText, addon:String)
	{
		if (textField.text.indexOf(addon) == -1)
			textField.text = addon + textField.text;
		else
			textField.text = textField.text.split(addon)[1];
	}
}
