package 
{	
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	
	public class SureMenu extends AlertMenu
	{
		private var yButton:SimpleButton;
		private var nButton:SimpleButton;
		private var pauseMenu:PauseMenu;
		
		public function SureMenu(p:PauseMenu,c:Boolean = false)
		{
			super(p.x,p.y,c);
			pauseMenu = p;
			
			if(!clone)
			{
				yButton = (getChildByName("yesButton") as SimpleButton);
				nButton = (getChildByName("noButton") as SimpleButton);
				yButton.addEventListener(MouseEvent.CLICK,endGame);
				nButton.addEventListener(MouseEvent.CLICK,hideMenu);
			}
		}
		public override function getClone():Entity
		{
			return new SureMenu(pauseMenu,true);
		}
		public function hideMenu(evt:MouseEvent):void
		{
			pauseMenu.visible = true;
			stage.focus = stage;
			removeFromStage();
		}
		public function endGame(evt:MouseEvent):void
		{
			removeFromStage();
			GameManager.endCurrentGame();
			GameManager.getTimeline().gotoAndStop(5);
		}
		public override function removeFromStage():void
		{
			yButton.removeEventListener(MouseEvent.CLICK,endGame);
			nButton.removeEventListener(MouseEvent.CLICK,hideMenu);
			super.removeFromStage();
		}
	}
}