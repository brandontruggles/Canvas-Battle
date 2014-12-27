package 
{	
	import flash.events.Event;
	import flash.display.MovieClip;
	
	public class Paintapede extends Boss
	{
		private var spawnedParts:Boolean;
		private var minipedeList:ArrayList;
		private var pseudoWidth:Number;
		private var pseudoHeight:Number;
		
		public function Paintapede(c:Boolean = false) 
		{
			super(700,160,720,5,5,c);
			
			if(!clone)
			{
				spawnedParts = false;
				minipedeList = new ArrayList();
				damage = 20;
				pseudoWidth = 187.05;
				pseudoHeight = 67;
				stoppingList.addObject(currentFrame);
				stoppingList.addObject(2);
				stoppingList.addObject(totalFrames);
				if(GameManager.getDifficulty() == 1)
				{
					xVelocity = 3;
					yVelocity = 3;
				}
				else if(GameManager.getDifficulty() == 2)
				{
					xVelocity = 4;
					yVelocity = 4;
				}
				AudioManager.stopAllAudio();
				AudioManager.loopAudio(AudioManager.getBossMusic());
				stop();
			}
		}
		public function getWidth():Number
		{
			return pseudoWidth;
		}
		public function getHeight():Number
		{
			return pseudoHeight;
		}
		public function getMinipedeList():ArrayList
		{
			return minipedeList;
		}
		public override function getClone():Entity
		{
			return new Paintapede(true);
		}
		public override function setXVelocity(v:Number):void
		{
			super.setXVelocity(v);
			for(var i = 0;i<minipedeList.listSize();i++)
			{
				minipedeList.getObject(i).setXVelocity(v);
				for(var i2 = 0;i2<minipedeList.getObject(i).getPartsList().listSize();i2++)
					minipedeList.getObject(i).getPartsList().getObject(i2).setXVelocity(v);
			}
		}
		public override function setYVelocity(v:Number):void
		{
			super.setYVelocity(v);
			for(var i = 0;i<minipedeList.listSize();i++)
			{
				minipedeList.getObject(i).setYVelocity(v);
				for(var i2 = 0;i2<minipedeList.getObject(i).getPartsList().listSize();i2++)
					minipedeList.getObject(i).getPartsList().getObject(i2).setYVelocity(v);
			}
		}
		public override function updateTimedVariables(evt:Event):void
		{
			super.updateTimedVariables(evt);
			if(!GameManager.gameIsPaused())
			{
				if(currentFrame == 1)
				{
					if(cautionAlert.parent == null)
						gotoAndStop(2);
				}
				else if(currentFrame == 2)
				{
					if(((MovieClip)(getChildAt(0))).currentFrame == ((MovieClip)(getChildAt(0))).totalFrames)
					{
						spawnParts();
						gotoAndStop(3);
						playingIntro = false;
					}
				}
				else
				{
					if(!invulnerable)
						invulnerable = true;
						
					for(var i = 0;i<minipedeList.listSize();i++)
						minipedeList.getObject(i).updateTimedVariables(evt);
				}
			}
		}
		public override function checkCollision():void
		{
			if(currentFrame == 2)
				super.checkCollision();
		}
		public function spawnParts():void
		{
			spawnedParts = true;
			var m:Minipede = new Minipede(x,y,0,this);
			m.addToParent(GameManager.getTimeline());
			minipedeList.addObject(m);
			var head1:GreenPaintapedeHead = new GreenPaintapedeHead(x-72.75,y,m);
			head1.addToParent(GameManager.getTimeline());
			var head2:BluePaintapedeHead = new BluePaintapedeHead(x-48.5,y,m);
			head2.addToParent(GameManager.getTimeline());
			var head3:PinkPaintapedeHead = new PinkPaintapedeHead(x-23,y,m);
			head3.addToParent(GameManager.getTimeline());
			var head4:RedPaintapedeHead = new RedPaintapedeHead(x,y,m);
			head4.addToParent(GameManager.getTimeline());
			var head5:PalePaintapedeHead = new PalePaintapedeHead(x+21,y,m);
			head5.addToParent(GameManager.getTimeline());
			var head6:YellowPaintapedeHead = new YellowPaintapedeHead(x+42,y,m);
			head6.addToParent(GameManager.getTimeline());
			var head7:LightPinkPaintapedeHead = new LightPinkPaintapedeHead(x+59.3,y,m);
			head7.addToParent(GameManager.getTimeline());
			var head8:GrayPaintapedeHead = new GrayPaintapedeHead(x+73.8,y,m);
			head8.addToParent(GameManager.getTimeline());
			m.faceRandomDirection();
		}
		public override function attachFade():void
		{
			
		}
		public override function die():void
		{
			AudioManager.stopAllAudio();
			GameManager.playBackgroundMusic();
			
			super.die();
			
			if(!CanvasManager.fourteenthCanvasIsUnlocked())
			{
				var c:Canvas = new Canvas(700,150,14);
				c.addToParent(GameManager.getTimeline());
			}
			
			APIManager.submitPaintapedeKilled();
		}
		public override function removeFromStage():void
		{
			var bossCount:Number = 0;
			for(var i = 0;i<GameManager.getEnemyList().listSize();i++)
			{
				var e:Enemy = (GameManager.getEnemyList().getObject(i) as Enemy);
				if(e != this && (e is MiniBoss || e is Boss))
					bossCount++;
			}
			
			if(bossCount == 0)
				if(SpawnManager.bossIsSpawned())
				{
					SpawnManager.setBossSpawned(false);
					SpawnManager.changeSpawnRandTo(40);
				}
				
			minipedeList = null;
			super.removeFromStage();
		}
	}
}