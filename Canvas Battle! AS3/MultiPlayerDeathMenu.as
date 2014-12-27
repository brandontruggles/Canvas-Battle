package  
{	
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	import flash.geom.ColorTransform;
	
	public class MultiPlayerDeathMenu extends AlertMenu
	{
		private var yButton:SimpleButton;
		private var nButton:SimpleButton;
		private var player:Player;
		
		public function MultiPlayerDeathMenu(p:Player,c:Boolean = false)
		{
			super(300,160,c);
			
			if(!clone)
			{
				player = p;
				yButton = (getChildByName("yesButton") as SimpleButton);
				nButton = (getChildByName("noButton") as SimpleButton);
				yButton.addEventListener(MouseEvent.CLICK,processYes);
				nButton.addEventListener(MouseEvent.CLICK,processNo);
			}
		}
		public override function getClone():Entity
		{
			return new MultiPlayerDeathMenu(player,true);
		}
		public function processYes(evt:MouseEvent):void
		{
			GameManager.setScore(Math.round(GameManager.getScore()/2));
			GameManager.getTimeline().gameGUI.topGUIBar.scoreText.textColor = new ColorTransform(0,0,0,0,255,255,255,1).color;
			GameManager.setOneUpApplied(false);
			
			var player:PlayerSpawnEffect = new PlayerSpawnEffect(100,140);
			player.addToParent(GameManager.getTimeline());
			
			for(var i = 0;i<GameManager.getMiscList().listSize();i++)
			{
				var m:Entity = (GameManager.getMiscList().getObject(i) as Entity);
				if(!(m is TutorialTextBanner))
					m.startPlaying();
			}
			for(var i2 = 0;i2<GameManager.getPlayerList().listSize();i2++)
			{
				var p:PlayerBall = (GameManager.getPlayerList().getObject(i2) as PlayerBall);
				p.startPlaying();
			}
			for(var i3 = 0;i3<GameManager.getEnemyList().listSize();i3++)
			{
				var e:Enemy = (GameManager.getEnemyList().getObject(i3) as Enemy);
				e.startPlaying();
			}
			removeFromStage();
		}
		public function processNo(evt:MouseEvent):void
		{
			removeFromStage();
			
			if(GameManager.getPlayerList().listSize() == 0)
			{
				GameManager.endCurrentGame();
				AudioManager.playAudio(AudioManager.getGameOverSound());
			}
			else
			{
				GameManager.setPaused(false);
				
				for(var i = 0;i<GameManager.getMiscList().listSize();i++)
				{
					var m:Entity = (GameManager.getMiscList().getObject(i) as Entity);
					if(!(m is TutorialTextBanner))
						m.startPlaying();
				}
				for(var i2 = 0;i2<GameManager.getPlayerList().listSize();i2++)
				{
					var p:PlayerBall = (GameManager.getPlayerList().getObject(i2) as PlayerBall);
					p.startPlaying();
				}
				for(var i3 = 0;i3<GameManager.getEnemyList().listSize();i3++)
				{
					var e:Enemy = (GameManager.getEnemyList().getObject(i3) as Enemy);
					e.startPlaying();
				}
				
				GameManager.getStage().focus = GameManager.getStage();
			}
		}
		public override function removeFromStage():void
		{
			GameManager.setPaused(false);
			yButton.removeEventListener(MouseEvent.CLICK,processYes);
			nButton.removeEventListener(MouseEvent.CLICK,processNo);
			yButton = null;
			nButton = null;
			player = null;
			super.removeFromStage();
		}
	}
}