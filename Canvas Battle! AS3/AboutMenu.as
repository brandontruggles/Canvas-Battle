package
{	
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	
	public class AboutMenu extends AlertMenu
	{
		private var bckButton:SimpleButton;
		
		public function AboutMenu(c:Boolean = false) 
		{
			super(300,150,c);
			if(!clone)
			{
				bckButton = (getChildByName("bButton") as SimpleButton);
				bckButton.addEventListener(MouseEvent.CLICK,goBackToStart);
			}
		}
		public override function getClone():Entity
		{
			return new AboutMenu(true);
		}
		public function goBackToStart(evt:MouseEvent):void
		{
			removeFromStage();
			GameManager.getTimeline().startMenu.visible = true;
		}
		public override function removeFromStage():void
		{
			bckButton.removeEventListener(MouseEvent.CLICK,goBackToStart);
			super.removeFromStage();
		}
	}
}