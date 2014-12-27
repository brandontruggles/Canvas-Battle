package  
{
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	
	public class CustomCanvasUnlockMenu extends AlertMenu
	{
		private var clButton:SimpleButton;
		public function CustomCanvasUnlockMenu(c:Boolean = false) 
		{
			super(300,150,c);
			
			if(!clone)
			{
				clButton = (getChildByName("cButton") as SimpleButton);
				clButton.addEventListener(MouseEvent.CLICK,resumeGame);
			}
		}
		public override function getClone():Entity
		{
			return new CustomCanvasUnlockMenu(true);
		}
		private function resumeGame(evt:MouseEvent):void
		{
			
			if(GameManager.getGameMode() == 0)
				TutorialManager.changeMessages();
				
			GameManager.setPaused(false);
			
			for(var i4 = 0;i4<GameManager.getMiscList().listSize();i4++)
			{
				var m:Entity = (GameManager.getMiscList().getObject(i4) as Entity);
				if(!(m is TutorialTextBanner))
					m.startPlaying();
			}
			for(var i5 = 0;i5<GameManager.getPlayerList().listSize();i5++)
			{
				var p:PlayerBall = (GameManager.getPlayerList().getObject(i5) as PlayerBall);
				p.startPlaying();
			}
			for(var i6 = 0;i6<GameManager.getEnemyList().listSize();i6++)
			{
				var e:Enemy = (GameManager.getEnemyList().getObject(i6) as Enemy);
				e.startPlaying();
			}
			
			GameManager.getTimeline().gameGUI.bottomGUIBar.cButton.visible = true;
			GameManager.getTimeline().gameGUI.bottomGUIBar.pButton.visible = true;
			
			stage.focus = stage;
			
			removeFromStage();
		}
		public override function removeFromStage():void
		{
			clButton.removeEventListener(MouseEvent.CLICK,resumeGame);
			super.removeFromStage();
		}
	}
}
