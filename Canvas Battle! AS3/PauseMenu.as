package 
{	
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	
	public class PauseMenu extends AlertMenu
	{
		private var rButton:SimpleButton;
		private var oButton:SimpleButton;
		private var mButton:SimpleButton;
		
		public function PauseMenu(c:Boolean = false)
		{
			super(300,160,c);
			
			if(!clone)
			{
				rButton = (getChildByName("resumeButton") as SimpleButton);
				oButton = (getChildByName("optionsButton") as SimpleButton);
				mButton = (getChildByName("menuButton") as SimpleButton);
				rButton.addEventListener(MouseEvent.CLICK,resumeGame);
				oButton.addEventListener(MouseEvent.CLICK,showOptions);
				mButton.addEventListener(MouseEvent.CLICK,showMainMenuAlert);
			}
		}
		public override function getClone():Entity
		{
			return new PauseMenu(true);
		}
		public function resumeGame(evt:MouseEvent):void
		{
			stage.focus = stage;
			GameManager.getTimeline().toggleGamePause();
		}
		public function showOptions(evt:MouseEvent):void
		{
			visible = false;
			var o:OptionsMenu = new OptionsMenu(this);
			o.addToParent(parent);
		}
		public function showMainMenuAlert(evt:MouseEvent):void
		{
			visible = false;
			var s:SureMenu = new SureMenu(this);
			s.addToParent(parent);
		}
		public override function removeFromStage():void
		{
			rButton.removeEventListener(MouseEvent.CLICK,resumeGame);
			oButton.removeEventListener(MouseEvent.CLICK,showOptions);
			mButton.removeEventListener(MouseEvent.CLICK,showMainMenuAlert);
			rButton = null;
			oButton = null;
			mButton = null;
			super.removeFromStage();
		}
	}
}