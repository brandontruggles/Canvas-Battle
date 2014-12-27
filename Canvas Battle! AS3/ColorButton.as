package  
{
	import flash.events.MouseEvent;
	import flash.ui.Mouse;
	import flash.display.MovieClip;
	import flash.utils.getQualifiedClassName;

	public class ColorButton extends MovieClip
	{
		private var toolTip:ToolTip;
		private var hasTip:Boolean;
		private var colorText:String;
		
		public function ColorButton()
		{
			hasTip = false;
			if(name == "blueButton" || name == "blueButton2")
				colorText = "Blue";
			else if(name == "greenButton" || name == "greenButton2")
				colorText = "Green";
			else if(name == "redButton" || name == "redButton2")
				colorText = "Red";
			else if(name == "brownButton" || name == "brownButton2")
				colorText = "Brown";
			else if(name == "orangeButton" || name == "orangeButton2")
				colorText = "Orange";
			else if(name == "pinkButton" || name == "pinkButton2")
				colorText = "Pink";
			else if(name == "grayButton" || name == "grayButton2")
				colorText = "Gray-Blue";
			else if(name == "violetButton" || name == "violetButton2")
				colorText = "Light Violet";
			else if(name == "whiteButton" || name == "whiteButton2")
				colorText = "White";
			else if(name == "blackButton" || name == "blackButton2")
				colorText = "Black";
			
			addEventListener(MouseEvent.CLICK,processColorButton);
			addEventListener(MouseEvent.MOUSE_MOVE,processMouseMove);
			addEventListener(MouseEvent.MOUSE_OUT,processMouseOut);
		}
		public function colorIsTaken():Boolean
		{
			if(GameManager.getP1Color().color == transform.colorTransform.color || GameManager.getP2Color().color == transform.colorTransform.color)
				return true;
			return false;
		}
		public function processMouseMove(evt:MouseEvent):void
		{
			Mouse.cursor = "button";
			if(!hasTip)
			{
				toolTip = new ToolTip(stage.mouseX,stage.mouseY,colorText);
				toolTip.x = stage.mouseX+toolTip.width/2+5;
				toolTip.y = stage.mouseY-toolTip.height/2-5;
				toolTip.addToParent(GameManager.getTimeline());
				hasTip = true;
			}
			else
			{
				toolTip.x = stage.mouseX+toolTip.width/2+5;
				toolTip.y = stage.mouseY-toolTip.height/2-5;
			}
		}
		public function processMouseOut(evt:MouseEvent):void
		{
			Mouse.cursor = "auto";
			if(hasTip)
			{
				toolTip.removeFromStage();
				toolTip = null;
				hasTip = false;
			}
		}
		public function processColorButton(evt:MouseEvent):void
		{
			if(!colorIsTaken())
			{
				if(name == "blueButton" || name == "greenButton" || name == "redButton" || name == "brownButton" || name == "orangeButton" || name == "pinkButton" || name == "grayButton" || name == "violetButton" || name == "whiteButton" || name == "blackButton")
				{
					GameManager.setP1Color(transform.colorTransform);
					
					if(GameManager.getGameMode() == 0 && TutorialManager.getMessageIndex() == 26)
						TutorialManager.changeMessages();
						
					((OptionsMenu)(parent)).highlight1.x = x;
					((OptionsMenu)(parent)).highlight1.y = y;
					if(GameManager.gameIsActive())
					{
						for(var i = 0;i<GameManager.getPlayerList().listSize();i++)
						if(GameManager.getPlayerList().getObject(i).getID() == 1)
						GameManager.getPlayerList().getObject(i).setColor(transform.colorTransform);
					}
				}
				else if(name == "blueButton2" || name == "greenButton2" || name == "redButton2" || name == "brownButton2" || name == "orangeButton2" || name == "pinkButton2" || name == "grayButton2" || name == "violetButton2" || name == "whiteButton2" || name == "blackButton2")
				{
					GameManager.setP2Color(transform.colorTransform);
					((OptionsMenu)(parent)).highlight2.x = x;
					((OptionsMenu)(parent)).highlight2.y = y;
					
					if(GameManager.gameIsActive())
					{
						for(var i2 = 0;i2<GameManager.getPlayerList().listSize();i2++)
						if(GameManager.getPlayerList().getObject(i2).getID() == 2)
						GameManager.getPlayerList().getObject(i2).setColor(transform.colorTransform);
					}
				}
			}
		}
		public override function toString():String
		{
			return getQualifiedClassName(this) + " @ X: " +x + " Y: " +y;
		}
	}
}