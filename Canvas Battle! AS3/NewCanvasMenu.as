package 
{	
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	import flash.display.MovieClip;
	import flash.text.TextField;
	import flash.display.Bitmap;
	
	public class NewCanvasMenu extends AlertMenu
	{
		private var cButton:SimpleButton;
		private var previewBox:MovieClip;
		private var canvasText:TextField;
		
		public function NewCanvasMenu(b:Bitmap,s:String,c:Boolean = false)
		{
			super(300,150,c);
			
			if(!clone)
			{
				cButton = (getChildByName("closeButton") as SimpleButton);
				previewBox = (getChildByName("pBox") as MovieClip);
				canvasText = (getChildByName("canvasName") as TextField);
				canvasText.text = "\"" + s + "\"";
				var previewBitmap:Bitmap = new Bitmap(b.bitmapData);
				previewBitmap.x = -previewBox.width/2;
				previewBitmap.y = -previewBox.height/2-1;
				previewBitmap.width = previewBox.width+1;
				previewBitmap.height = previewBox.height+2;
				previewBox.addChild(previewBitmap);
				
				if(!GameManager.gameIsPaused())
				{
					GameManager.setPaused(true);
					for(var i4 = 0;i4<GameManager.getMiscList().listSize();i4++)
					{
						var m:Entity = (GameManager.getMiscList().getObject(i4) as Entity);
						if(!(m is TutorialTextBanner))
							m.stopPlaying();
					}
					for(var i5 = 0;i5<GameManager.getPlayerList().listSize();i5++)
					{
						var p:PlayerBall = (GameManager.getPlayerList().getObject(i5) as PlayerBall);
						p.stopPlaying();
					}
					for(var i6 = 0;i6<GameManager.getEnemyList().listSize();i6++)
					{
						var e:Enemy = (GameManager.getEnemyList().getObject(i6) as Enemy);
						e.stopPlaying();
					}
					GameManager.getTimeline().gameGUI.bottomGUIBar.cButton.visible = false;
					GameManager.getTimeline().gameGUI.bottomGUIBar.pButton.visible = false;
				}
				cButton.addEventListener(MouseEvent.CLICK,exit);
			}
		}
		public override function getClone():Entity
		{
			return new NewCanvasMenu(null,null,true);
		}
		public function exit(evt:MouseEvent):void
		{
			removeFromStage();
		}
		public override function removeFromStage():void
		{
			if(GameManager.getGameMode() == 0 && CanvasManager.getNumberOfCanvasesUnlocked()!=5)
				TutorialManager.changeMessages();
			cButton.removeEventListener(MouseEvent.CLICK,exit);
			if(GameManager.gameIsPaused())
			{
				GameManager.setPaused(false);
				
				if(CanvasManager.getNumberOfCanvasesUnlocked() != 5)
				{
					GameManager.getTimeline().gameGUI.bottomGUIBar.cButton.visible = true;
					GameManager.getTimeline().gameGUI.bottomGUIBar.pButton.visible = true;
				}
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
			}
			
			cButton = null;
			previewBox = null;
			canvasText = null;
			stage.focus = stage;
			super.removeFromStage();
		}
	}
}