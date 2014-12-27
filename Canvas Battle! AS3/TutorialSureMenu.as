package 
{	
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	
	public class TutorialSureMenu extends AlertMenu
	{
		private var yButton:SimpleButton;
		private var nButton:SimpleButton;
		private var pauseMenu:PauseMenu;
		
		public function TutorialSureMenu(c:Boolean = false)
		{
			super(300,160,c);
			
			if(!clone)
			{
				yButton = (getChildByName("yesButton") as SimpleButton);
				nButton = (getChildByName("noButton") as SimpleButton);
				yButton.addEventListener(MouseEvent.CLICK,startTut);
				nButton.addEventListener(MouseEvent.CLICK,hideMenu);
			}
		}
		public override function getClone():Entity
		{
			return new TutorialSureMenu(true);
		}
		public function hideMenu(evt:MouseEvent):void
		{
			removeFromStage();
		}
		public function startTut(evt:MouseEvent):void
		{
			removeFromStage();
			GameManager.getTimeline().showTutorial();
			AudioManager.stopAllAudio();
			AudioManager.loopAudio(AudioManager.getTutorialMusic());
		}
		public override function removeFromStage():void
		{
			yButton.removeEventListener(MouseEvent.CLICK,startTut);
			nButton.removeEventListener(MouseEvent.CLICK,hideMenu);
			yButton = null;
			nButton = null;
			pauseMenu = null;
			super.removeFromStage();
		}
	}
}