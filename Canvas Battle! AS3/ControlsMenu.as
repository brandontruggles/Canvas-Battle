package  
{	
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	
	public class ControlsMenu extends AlertMenu
	{
		private var oButton:SimpleButton;
		private var optionsMenu:OptionsMenu;
		private var assignMenu:AssignMenu;
		
		public function ControlsMenu(o:OptionsMenu,c:Boolean = false)
		{
			super(300,150,c);
			
			if(!clone)
			{
				oButton = (getChildByName("optionsButton") as SimpleButton);
				
				(getChildByName("leftKeyButton") as KeyButton).setKeyName("P1 Move Left");
				(getChildByName("rightKeyButton") as KeyButton).setKeyName("P1 Move Right");
				(getChildByName("upKeyButton") as KeyButton).setKeyName("P1 Move Up");
				(getChildByName("downKeyButton") as KeyButton).setKeyName("P1 Move Down");
				(getChildByName("shootKeyButton") as KeyButton).setKeyName("P1 Shoot");
				(getChildByName("shieldKeyButton") as KeyButton).setKeyName("P1 Shield");
				(getChildByName("pauseKeyButton") as KeyButton).setKeyName("Pause");
				(getChildByName("canvasKeyButton") as KeyButton).setKeyName("Canvases");
				(getChildByName("leftKeyButton2") as KeyButton).setKeyName("P2 Move Left");
				(getChildByName("rightKeyButton2") as KeyButton).setKeyName("P2 Move Right");
				(getChildByName("upKeyButton2") as KeyButton).setKeyName("P2 Move Up");
				(getChildByName("downKeyButton2") as KeyButton).setKeyName("P2 Move Down");
				(getChildByName("shootKeyButton2") as KeyButton).setKeyName("P2 Shoot");
				(getChildByName("shieldKeyButton2") as KeyButton).setKeyName("P2 Shield");
				
				(getChildByName("leftKeyButton") as KeyButton).changeText(ControlsManager.getLeftLabel());
				(getChildByName("rightKeyButton") as KeyButton).changeText(ControlsManager.getRightLabel());
				(getChildByName("upKeyButton") as KeyButton).changeText(ControlsManager.getUpLabel());
				(getChildByName("downKeyButton") as KeyButton).changeText(ControlsManager.getDownLabel());
				(getChildByName("shootKeyButton") as KeyButton).changeText(ControlsManager.getShootLabel());
				(getChildByName("shieldKeyButton") as KeyButton).changeText(ControlsManager.getShieldLabel());
				(getChildByName("pauseKeyButton") as KeyButton).changeText(ControlsManager.getPauseLabel());
				(getChildByName("canvasKeyButton") as KeyButton).changeText(ControlsManager.getCanvasLabel());
				(getChildByName("leftKeyButton2") as KeyButton).changeText(ControlsManager.getLeftLabel2());
				(getChildByName("rightKeyButton2") as KeyButton).changeText(ControlsManager.getRightLabel2());
				(getChildByName("upKeyButton2") as KeyButton).changeText(ControlsManager.getUpLabel2());
				(getChildByName("downKeyButton2") as KeyButton).changeText(ControlsManager.getDownLabel2());
				(getChildByName("shootKeyButton2") as KeyButton).changeText(ControlsManager.getShootLabel2());
				(getChildByName("shieldKeyButton2") as KeyButton).changeText(ControlsManager.getShieldLabel2());
				
				oButton.addEventListener(MouseEvent.CLICK,goBackToOptions);
				optionsMenu = o;
			}
		}
		public override function getClone():Entity
		{
			return new ControlsMenu(optionsMenu,true);
		}
		public function goBackToOptions(evt:MouseEvent):void
		{
			optionsMenu.visible = true;
			removeFromStage();
		}
		public override function removeFromStage():void
		{
			oButton.removeEventListener(MouseEvent.CLICK,goBackToOptions);
			oButton = null;
			optionsMenu = null;
			assignMenu = null;
			super.removeFromStage();
		}
	}
}