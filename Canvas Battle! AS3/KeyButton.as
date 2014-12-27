package  
{
	import flash.events.MouseEvent;
	import flash.events.KeyboardEvent;
	import flash.ui.Mouse;
	import flash.display.MovieClip;
	import flash.text.TextField;
	import flash.utils.getQualifiedClassName;

	public class KeyButton extends MovieClip
	{
		private var keyName:String;
		private var keyTextField:TextField;
		private var assignMenu:AssignMenu;
		public function KeyButton()
		{
			addEventListener(MouseEvent.CLICK,processControlButton);
			addEventListener(MouseEvent.MOUSE_OVER,processMouseOver);
			addEventListener(MouseEvent.MOUSE_OUT,processMouseOut);
			keyTextField = (getChildByName("keyText") as TextField);
			keyName = "";
		}
		public function getKeyName():String
		{
			return keyName;
		}
		public function keyIsTaken(key:Number):Boolean
		{
			if(key == ControlsManager.getP1LeftKey() || key == ControlsManager.getP1RightKey() || key == ControlsManager.getP1UpKey() || key == ControlsManager.getP1DownKey() || key == ControlsManager.getP1ShootKey() || key == ControlsManager.getP1ShieldKey() || key == ControlsManager.getPauseKey() || key == ControlsManager.getP2LeftKey() || key == ControlsManager.getP2RightKey() || key == ControlsManager.getP2UpKey() || key == ControlsManager.getP2DownKey() || key == ControlsManager.getP2ShootKey() || key == ControlsManager.getP2ShieldKey() || key == ControlsManager.getCanvasKey())
				return true;
			return false;
		}
		public function getStringFromKey(evt:KeyboardEvent):String
		{
			var newString:String = ""+evt.keyCode;
			
			if(evt.charCode!=0)
			{
				if(evt.keyCode!=46 && evt.keyCode!=27 && evt.keyCode!=8 && evt.keyCode!=13 && evt.keyCode!=32 && evt.keyCode!=9)
					newString = String.fromCharCode(evt.charCode).toUpperCase();
				else if(evt.keyCode == 46)
					newString = "DEL";
				else if(evt.keyCode == 27)
					newString = "ESC";
				else if(evt.keyCode == 8)
					newString = "BKSPC";
				else if(evt.keyCode == 13)
					newString = "Enter";
				else if(evt.keyCode == 32)
					newString = "Space";
				else if(evt.keyCode == 9)
					newString = "Tab";
			}
			else
			{
				if(evt.keyCode == 112)
					newString = "F1";
				else if(evt.keyCode == 113)
					newString = "F2";
				else if(evt.keyCode == 114)
					newString = "F3";
				else if(evt.keyCode == 115)
					newString = "F4";
				else if(evt.keyCode == 116)
					newString = "F5";
				else if(evt.keyCode == 117)
					newString = "F6";
				else if(evt.keyCode == 118)
					newString = "F7";
				else if(evt.keyCode == 119)
					newString = "F8";
				else if(evt.keyCode == 120)
					newString = "F9";
				else if(evt.keyCode == 121)
					newString = "F10";
				else if(evt.keyCode == 122)
					newString = "F11";
				else if(evt.keyCode == 123)
					newString = "F12";
				else if(evt.keyCode == 20)
					newString = "CAPS";
				else if(evt.keyCode == 16)
					newString = "Shift";
				else if(evt.keyCode == 17)
					newString = "CTRL";
				else if(evt.keyCode == 45)
					newString = "INS";
				else if(evt.keyCode == 36)
					newString = "Home";
				else if(evt.keyCode == 33)
					newString = "PG UP";
				else if(evt.keyCode == 34)
					newString = "PG DN";
				else if(evt.keyCode == 35)
					newString = "End";
				else if(evt.keyCode == 93)
					newString = "Menu";
				else if(evt.keyCode == 37)
					newString = "LArr";
				else if(evt.keyCode == 38)
					newString = "UArr";
				else if(evt.keyCode == 39)
					newString = "RArr";
				else if(evt.keyCode == 40)
					newString = "DArr";
				else if(evt.keyCode == 90)
					newString = "NUM";
				else if(evt.keyCode == 91)
					newString = "LWIN";
				else if(evt.keyCode == 92)
					newString = "RWIN";
				else if(evt.keyCode == 144)
					newString = "NUM";
				else if(evt.keyCode == 145)
					newString = "SCROLL";
				else if(evt.keyCode == 19)
					newString = "PSBRK";
			}
			return newString;
		}
		public function changeText(t:String):void
		{
			keyTextField.text = t;
		}
		public function setKeyName(n:String):void
		{
			keyName = n;
		}
		public function processMouseOver(evt:MouseEvent):void
		{
			Mouse.cursor = "button";
		}
		public function processMouseOut(evt:MouseEvent):void
		{
			Mouse.cursor = "auto";
		}
		public function processControlButton(evt:MouseEvent):void
		{
			assignMenu = new AssignMenu(keyName);
			assignMenu.addToParent((parent as ControlsMenu).parent);
			stage.addEventListener(KeyboardEvent.KEY_DOWN,processControlKey);
			stage.focus = stage;
		}
		public function processControlKey(evt:KeyboardEvent):void
		{
			changeCorrespondingKey(evt);
		}
		public function changeCorrespondingKey(evt:KeyboardEvent):void
		{
			if(!keyIsTaken(evt.keyCode))
			{
				if(name == "leftKeyButton")
				{
					ControlsManager.setP1LeftKey(evt.keyCode);
					ControlsManager.setLeftLabel(getStringFromKey(evt));
				}
				else if(name == "rightKeyButton")
				{
					ControlsManager.setP1RightKey(evt.keyCode);
					ControlsManager.setRightLabel(getStringFromKey(evt));
				}
				else if(name == "upKeyButton")
				{
					ControlsManager.setP1UpKey(evt.keyCode);
					ControlsManager.setUpLabel(getStringFromKey(evt));
				}
				else if(name == "downKeyButton")
				{
					ControlsManager.setP1DownKey(evt.keyCode);
					ControlsManager.setDownLabel(getStringFromKey(evt));
				}
				else if(name == "shootKeyButton")
				{
					ControlsManager.setP1ShootKey(evt.keyCode);
					ControlsManager.setShootLabel(getStringFromKey(evt));
				}
				else if(name == "shieldKeyButton")
				{
					ControlsManager.setP1ShieldKey(evt.keyCode);
					ControlsManager.setShieldLabel(getStringFromKey(evt));
				}
				else if(name == "pauseKeyButton")
				{
					ControlsManager.setPauseKey(evt.keyCode);
					ControlsManager.setPauseLabel(getStringFromKey(evt));
				}
				else if(name == "canvasKeyButton")
				{
					ControlsManager.setCanvasKey(evt.keyCode);
					ControlsManager.setCanvasLabel(getStringFromKey(evt));
				}
				else if(name == "leftKeyButton2")
				{
					ControlsManager.setP2LeftKey(evt.keyCode);
					ControlsManager.setLeftLabel2(getStringFromKey(evt));
				}
				else if(name == "rightKeyButton2")
				{
					ControlsManager.setP2RightKey(evt.keyCode);
					ControlsManager.setRightLabel2(getStringFromKey(evt));
				}
				else if(name == "upKeyButton2")
				{
					ControlsManager.setP2UpKey(evt.keyCode);
					ControlsManager.setUpLabel2(getStringFromKey(evt));
				}
				else if(name == "downKeyButton2")
				{
					ControlsManager.setP2DownKey(evt.keyCode);
					ControlsManager.setDownLabel2(getStringFromKey(evt));
				}
				else if(name == "shootKeyButton2")
				{
					ControlsManager.setP2ShootKey(evt.keyCode);
					ControlsManager.setShootLabel2(getStringFromKey(evt));
				}
				else if(name == "shieldKeyButton2")
				{
					ControlsManager.setP2ShieldKey(evt.keyCode);
					ControlsManager.setShieldLabel2(getStringFromKey(evt));
				}
				
				keyTextField.text = getStringFromKey(evt);
				assignMenu.removeFromStage();
				stage.removeEventListener(KeyboardEvent.KEY_DOWN,processControlKey);
			}
			else
			{
				assignMenu.showWarning(evt.keyCode);
			}
		}
		public override function toString():String
		{
			return getQualifiedClassName(this) + " @ X: " + x + " Y: " +y;
		}
	}
}