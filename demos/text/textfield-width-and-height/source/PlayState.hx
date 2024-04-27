package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	override function create()
	{
		super.create();
		
		final gap = 4;
		final margin = 8;
		var xCoord:Float = margin;
		var yCoord:Float = margin;
		
		var autoSized = createText(xCoord, yCoord, "autosized");
		add(autoSized);
		yCoord += autoSized.height + gap;
		
		var fixedSize = createText(xCoord, yCoord, "fixed size");
		fixedSize.fieldWidth = 70;
		fixedSize.fieldHeight = 24;
		add(fixedSize);
		yCoord += fixedSize.height + gap;
		
		var autoHeight = createText(xCoord, yCoord, 'fixed width\nauto height');
		autoHeight.fieldWidth = 70;
		autoHeight.fieldHeight = 0;
		add(autoHeight);
		yCoord += autoHeight.height + gap;
		
		final prefix = 'Description: ';
		
		// create a button that add or removes the prefix on click
		var btn:FlxButton = null;
		btn = new FlxButton(0, 0, "Add Text", function()
		{
			if (btn.text == "Add Text")
			{
				addText(autoSized, prefix);
				addText(fixedSize, prefix);
				addText(autoHeight, prefix);
				btn.text = "Remove Text";
			}
			else
			{
				removeText(autoSized, prefix);
				removeText(fixedSize, prefix);
				removeText(autoHeight, prefix);
				btn.text = "Add Text";
			}
		});
		btn.x = FlxG.width - btn.width - margin;
		btn.y = FlxG.height - btn.height - margin;
		add(btn);
	}
	
	/**
	 * Simple helper to create a stylish FlxText
	 */
	function createText(x:Float = 0, y:Float = 0, text:String, size = 8)
	{
		var field = new FlxText(x, y, 0, text, size);
		field.color = FlxColor.CYAN;
		// accessing background through underlying openfl TextField object
		field.textField.background = true;
		field.textField.backgroundColor = 0x0C365F;
		return field;
	}
	
	function addText(field:FlxText, prefix:String)
	{
		field.text = prefix + field.text;
	}
	
	function removeText(field:FlxText, prefix:String)
	{
		field.text = field.text.split(prefix)[1];
	}
}
