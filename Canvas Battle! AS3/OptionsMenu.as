package  
{	
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	import flash.display.MovieClip;
	import flash.ui.Mouse;
	
	public class OptionsMenu extends AlertMenu
	{
		private var bList:ArrayList;
		private var bList2:ArrayList;
		private var bButton:SimpleButton;
		private var cButton:SimpleButton;
		private var pauseMenu:PauseMenu;
		private var startMenu:MovieClip;
		private var lowBttn:MovieClip;
		private var medBttn:MovieClip;
		private var highBttn:MovieClip;
		private var bestBttn:MovieClip;
		private var splatterBttn:MovieClip;
		
		public function OptionsMenu(p:PauseMenu = null,s:MovieClip = null,c:Boolean = false)
		{
			super(300,150,c);
			
			if(!clone)
			{
			
				pauseMenu = p;
				startMenu = s;
				
				lowBttn = (getChildByName("lowButton") as MovieClip);
				medBttn = (getChildByName("mediumButton") as MovieClip);
				highBttn = (getChildByName("highButton") as MovieClip);
				bestBttn = (getChildByName("bestButton") as MovieClip);
				splatterBttn = (getChildByName("splatterButton") as MovieClip);
				
				bList = new ArrayList();
				bList2 = new ArrayList();
				
				bButton = (getChildByName("backButton") as SimpleButton);
				cButton = (getChildByName("controlsButton") as SimpleButton);
				
				bButton.addEventListener(MouseEvent.CLICK,goBack);
				cButton.addEventListener(MouseEvent.CLICK,showControls);
				splatterBttn.addEventListener(MouseEvent.CLICK,toggleSplatters);
				
				bList.addObject(getChildByName("redButton"));
				bList.addObject(getChildByName("blueButton"));
				bList.addObject(getChildByName("greenButton"));
				bList.addObject(getChildByName("brownButton"));
				bList.addObject(getChildByName("orangeButton"));
				bList.addObject(getChildByName("pinkButton"));
				bList.addObject(getChildByName("violetButton"));
				bList.addObject(getChildByName("grayButton"));
				bList.addObject(getChildByName("whiteButton"));
				bList.addObject(getChildByName("blackButton"));
				
				bList2.addObject(getChildByName("redButton2"));
				bList2.addObject(getChildByName("blueButton2"));
				bList2.addObject(getChildByName("greenButton2"));
				bList2.addObject(getChildByName("brownButton2"));
				bList2.addObject(getChildByName("orangeButton2"));
				bList2.addObject(getChildByName("pinkButton2"));
				bList2.addObject(getChildByName("violetButton2"));
				bList2.addObject(getChildByName("grayButton2"));
				bList2.addObject(getChildByName("whiteButton2"));
				bList2.addObject(getChildByName("blackButton2"));
				
				for(var i = 0;i<bList.listSize();i++)
				if(bList.getObject(i).transform.colorTransform.color == GameManager.getP1Color().color)
				{
					getChildByName("highlight1").x = bList.getObject(i).x;
					getChildByName("highlight1").y = bList.getObject(i).y;
				}
				
				for(var i2 = 0;i2<bList2.listSize();i2++)
				if(bList2.getObject(i2).transform.colorTransform.color == GameManager.getP2Color().color)
				{
					getChildByName("highlight2").x = bList2.getObject(i2).x;
					getChildByName("highlight2").y = bList2.getObject(i2).y;
				}
				
				if(GameManager.getStage().quality == "LOW")
				{
					getChildByName("highlight3").x = lowBttn.x;
					getChildByName("highlight3").y = lowBttn.y;
				}
				else if(GameManager.getStage().quality == "MEDIUM")
				{
					getChildByName("highlight3").x = medBttn.x;
					getChildByName("highlight3").y = medBttn.y;
				}
				else if(GameManager.getStage().quality == "HIGH")
				{
					getChildByName("highlight3").x = highBttn.x;
					getChildByName("highlight3").y = highBttn.y;
				}
				else if(GameManager.getStage().quality == "BEST")
				{
					getChildByName("highlight3").x = bestBttn.x;
					getChildByName("highlight3").y = bestBttn.y;
				}
				lowBttn.addEventListener(MouseEvent.CLICK,switchGameQualityToLow);
				medBttn.addEventListener(MouseEvent.CLICK,switchGameQualityToMedium);
				highBttn.addEventListener(MouseEvent.CLICK,switchGameQualityToHigh);
				bestBttn.addEventListener(MouseEvent.CLICK,switchGameQualityToBest);
				lowBttn.addEventListener(MouseEvent.MOUSE_MOVE,changeCursor);
				medBttn.addEventListener(MouseEvent.MOUSE_MOVE,changeCursor);
				highBttn.addEventListener(MouseEvent.MOUSE_MOVE,changeCursor);
				bestBttn.addEventListener(MouseEvent.MOUSE_MOVE,changeCursor);
				splatterBttn.addEventListener(MouseEvent.MOUSE_MOVE,changeCursor);
				lowBttn.addEventListener(MouseEvent.MOUSE_OUT,revertCursor);
				medBttn.addEventListener(MouseEvent.MOUSE_OUT,revertCursor);
				highBttn.addEventListener(MouseEvent.MOUSE_OUT,revertCursor);
				bestBttn.addEventListener(MouseEvent.MOUSE_OUT,revertCursor);
				splatterBttn.addEventListener(MouseEvent.MOUSE_OUT,revertCursor);
				
				if(GameManager.overlayIsAllowed())
					splatterBttn.buttonText.text = "on";
				else
					splatterBttn.buttonText.text = "off";
			}
		}
		public function getPauseMenu():PauseMenu
		{
			return pauseMenu;
		}
		public function goBack(evt:MouseEvent):void
		{
			if(pauseMenu!=null)
				pauseMenu.visible = true;
			else
				startMenu.visible = true;
			stage.focus = stage;
			removeFromStage();
		}
		public function showControls(evt:MouseEvent):void
		{
			var cMenu:ControlsMenu = new ControlsMenu(this);
			cMenu.addToParent(parent);
			visible = false;
		}
		public function switchGameQualityToLow(evt:MouseEvent):void
		{
			GameManager.getStage().quality = "LOW";
			getChildByName("highlight3").x = lowBttn.x;
			getChildByName("highlight3").y = lowBttn.y;
		}
		public function switchGameQualityToMedium(evt:MouseEvent):void
		{
			GameManager.getStage().quality = "MEDIUM";
			getChildByName("highlight3").x = medBttn.x;
			getChildByName("highlight3").y = medBttn.y;
		}
		public function switchGameQualityToHigh(evt:MouseEvent):void
		{
			GameManager.getStage().quality = "HIGH";
			getChildByName("highlight3").x = highBttn.x;
			getChildByName("highlight3").y = highBttn.y;
		}
		public function switchGameQualityToBest(evt:MouseEvent):void
		{
			GameManager.getStage().quality = "BEST";
			getChildByName("highlight3").x = bestBttn.x;
			getChildByName("highlight3").y = bestBttn.y;
		}
		public function changeCursor(evt:MouseEvent):void
		{
			Mouse.cursor = "button";
		}
		public function revertCursor(evt:MouseEvent):void
		{
			Mouse.cursor = "auto";
		}
		public function toggleSplatters(evt:MouseEvent):void
		{
			if(GameManager.overlayIsAllowed())
			{
				splatterBttn.buttonText.text = "off";
				GameManager.setOverlayAllowed(false);
				GameManager.setPaintOverlay(new PaintOverlay());
			}
			else
			{
				splatterBttn.buttonText.text = "on";
				GameManager.setOverlayAllowed(true);
			}
		}
		public override function removeFromStage():void
		{
			bButton.removeEventListener(MouseEvent.CLICK,goBack);
			cButton.removeEventListener(MouseEvent.CLICK,showControls);
			lowBttn.removeEventListener(MouseEvent.CLICK,switchGameQualityToLow);
			medBttn.removeEventListener(MouseEvent.CLICK,switchGameQualityToMedium);
			highBttn.removeEventListener(MouseEvent.CLICK,switchGameQualityToHigh);
			bestBttn.removeEventListener(MouseEvent.CLICK,switchGameQualityToBest);
			splatterBttn.addEventListener(MouseEvent.CLICK,toggleSplatters);
			lowBttn.removeEventListener(MouseEvent.MOUSE_MOVE,changeCursor);
			medBttn.removeEventListener(MouseEvent.MOUSE_MOVE,changeCursor);
			highBttn.removeEventListener(MouseEvent.MOUSE_MOVE,changeCursor);
			bestBttn.removeEventListener(MouseEvent.MOUSE_MOVE,changeCursor);
			splatterBttn.removeEventListener(MouseEvent.MOUSE_MOVE,changeCursor);
			lowBttn.removeEventListener(MouseEvent.MOUSE_OUT,revertCursor);
			medBttn.removeEventListener(MouseEvent.MOUSE_OUT,revertCursor);
			highBttn.removeEventListener(MouseEvent.MOUSE_OUT,revertCursor);
			bestBttn.removeEventListener(MouseEvent.MOUSE_OUT,revertCursor);
			splatterBttn.removeEventListener(MouseEvent.MOUSE_OUT,revertCursor);
			bList = null;
			bList2 = null;
			bButton = null;
			cButton = null;
			pauseMenu = null;
			startMenu = null;
			lowBttn = null;
			medBttn = null;
			highBttn = null;
			bestBttn = null;
			splatterBttn = null;
			super.removeFromStage();
		}
	}
}