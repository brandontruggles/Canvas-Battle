package  
{	
	import flash.events.Event;
	
	public class SpawnManager
	{
		private static var spawnRand:Number;
		private static var spawnTimer:Number;
		private static var enemyTimer:Number;
		private static var changesBeforeBoss:Number;
		private static var bossSpawned:Boolean;
		
		
		public static function init():void
		{
			bossSpawned = false;
			changesBeforeBoss = 3;
			changeSpawnRandTo(40);
		}
		public static function bossIsSpawned():Boolean
		{
			return bossSpawned;
		}
		public static function updateTimers(evt:Event):void
		{
			if(!GameManager.gameIsPaused() && GameManager.gameIsActive() && GameManager.getGameMode()!=3)
			{
				if(!bossSpawned)
				{
					if(spawnTimer<360)
						spawnTimer++;
					else
						changeSpawnRand();
				}
				
				if(!GameManager.timeIsSlowed())
				{
					if(enemyTimer<60/GameManager.getDifficulty())
						enemyTimer++;
					else if(!bossSpawned)
					{
						spawnEnemy();
						enemyTimer = 0;
					}
				}
				else
				{
					if(enemyTimer<120/GameManager.getDifficulty())
						enemyTimer++;
					else if(!bossSpawned)
					{
						spawnEnemy();
						enemyTimer = 0;
					}
				}
			}
		}
		public static function spawnPowerUp():void
		{
			if(spawnRand<=40)
			{
				var h:HealthPowerUp = new HealthPowerUp(Math.random()*500+50,Math.random()*150+50);
				h.addToParent(GameManager.getTimeline());
			}
			else if(spawnRand<=80)
			{
				var r:RapidFirePowerUp = new RapidFirePowerUp(Math.random()*500+50,Math.random()*150+50);
				r.addToParent(GameManager.getTimeline());
			}
			else if(spawnRand<=120)
			{
				var s:PlayerSlowPowerUp = new PlayerSlowPowerUp(Math.random()*500+50,Math.random()*150+50);
				s.addToParent(GameManager.getTimeline());
			}
			else
			{
				var c:ChaoticBomb = new ChaoticBomb(Math.random()*500+50,Math.random()*150+50);
				c.addToParent(GameManager.getTimeline());
			}
		}
		public static function spawnEnemy():void
		{
			if(GameManager.getCurrentDimension() == GameManager.DIMENSION_NORMAL())
			{
				if(spawnRand<=60)
				{
					if(Math.round(Math.random()*4) == 4)
						spawnPurpleBall();
					else
						spawnGreenBall();
				}
				else if(spawnRand<=80)
				{
					spawnLightBlueBall();
				}
				else if(spawnRand<=100)
				{
					spawnBrownBall();
				}
				else if(spawnRand<=120)
				{
					for(var i = 0;i<GameManager.getDifficulty();i++)
						spawnPinkBall();
				}
				else if(spawnRand<=140)
				{
					spawnGrayBall();
				}
				else if(spawnRand<=150)
				{
					if(changesBeforeBoss == 0)
					{
						spawnPaintapede();
						changesBeforeBoss = 3;
					}
					else
						changeSpawnRandTo(40);
				}
				else if(spawnRand<=160)
				{
					if(changesBeforeBoss == 0)
					{
						spawnWaterBoss();
						changesBeforeBoss = 3;
					}
					else
						changeSpawnRandTo(40);
				}
				else if(spawnRand<=170)
				{
					if(changesBeforeBoss == 0)
					{
						changesBeforeBoss = 3;
						spawnPaintBrushBoss();
					}
					else
						changeSpawnRandTo(40);
				}
			}
			else if(GameManager.getCurrentDimension() == GameManager.DIMENSION_CHAOTIC())
			{
				if(spawnRand<=120)
				{
					if(Math.round(Math.random()*4) == 4)
						spawnChaoticBomb();
					else
						spawnChaoticBall();
				}
				else if(spawnRand<=150)
				{
					if(changesBeforeBoss == 0)
					{
						changesBeforeBoss = 3;
						spawnChaoticBoss();
					}
					else
						changeSpawnRandTo(40);
				}
				else if(spawnRand<=170)
				{
					spawnPortal();
					changeSpawnRandTo(40);
				}
			}
		}
		public static function changeSpawnRand():void
		{
			spawnRand = Math.random()*170;
			spawnTimer = 0;
			
			if(changesBeforeBoss>0)
					changesBeforeBoss--;
					
			if(spawnRand>=0 && spawnRand<=5 && GameManager.gameIsActive() && GameManager.getGameMode()!=3)
			{
				var canvasPresent:Boolean = false;
				for(var i = 0;i<GameManager.getMiscList().listSize();i++)
					if(GameManager.getMiscList().getObject(i) is Canvas)
						canvasPresent = true;
				
				if(!canvasPresent)
					spawnCanvas();
			}
		}
		public static function changeSpawnRandTo(n:Number):void
		{
			spawnRand = n;
			spawnTimer = 0;
			
			if(changesBeforeBoss>0)
					changesBeforeBoss--;
					
			if(spawnRand>=0 && spawnRand<=5 && GameManager.gameIsActive() && GameManager.getGameMode()!=3)
			{
				var canvasPresent:Boolean = false;
				
				for(var i = 0;i<GameManager.getMiscList().listSize();i++)
					if(GameManager.getMiscList().getObject(i) is Canvas)
						canvasPresent = true;
				
				if(!canvasPresent)
					spawnCanvas();
			}
		}
		public static function spawnCanvas():void
		{
			var canvasNumber:Number = Math.round(Math.random()*7)+4;
			var canSpawn:Boolean = false;
			if(canvasNumber == 4)
			{
				if(!CanvasManager.fourthCanvasIsUnlocked())
					canSpawn = true;
			}
			else if(canvasNumber == 5)
			{
				if(!CanvasManager.fifthCanvasIsUnlocked())
					canSpawn = true;
			}
			else if(canvasNumber == 6)
			{
				if(!CanvasManager.sixthCanvasIsUnlocked())
					canSpawn = true;
			}
			else if(canvasNumber == 7)
			{
				if(!CanvasManager.seventhCanvasIsUnlocked())
					canSpawn = true;
			}
			else if(canvasNumber == 8)
			{
				if(!CanvasManager.eighthCanvasIsUnlocked())
					canSpawn = true;
			}
			else if(canvasNumber == 9)
			{
				if(!CanvasManager.ninethCanvasIsUnlocked())
					canSpawn = true;
			}
			else if(canvasNumber == 10)
			{
				if(!CanvasManager.tenthCanvasIsUnlocked())
					canSpawn = true;
			}
			else if(canvasNumber == 11)
			{
				if(!CanvasManager.eleventhCanvasIsUnlocked())
					canSpawn = true;
			}
			if(canSpawn)
			{
				var c = new Canvas(700,150,canvasNumber);
				c.addToParent(GameManager.getTimeline());
			}
			else if(!CanvasManager.fourthCanvasIsUnlocked() || !CanvasManager.fifthCanvasIsUnlocked() || !CanvasManager.sixthCanvasIsUnlocked() || !CanvasManager.seventhCanvasIsUnlocked() || !CanvasManager.eighthCanvasIsUnlocked() || !CanvasManager.ninethCanvasIsUnlocked() || !CanvasManager.tenthCanvasIsUnlocked() || !CanvasManager.eleventhCanvasIsUnlocked())
				spawnCanvas();
		}
		public static function spawnGreenBall():void
		{
			var ball:GreenBall = new GreenBall();
			ball.addToParent(GameManager.getTimeline());
		}
		public static function spawnPurpleBall():void
		{
			var ball:PurpleBall = new PurpleBall();
			ball.addToParent(GameManager.getTimeline());
		}
		public static function spawnLightBlueBall():void
		{
			var ball:LightBlueBall = new LightBlueBall();
			ball.addToParent(GameManager.getTimeline());
		}
		public static function spawnPinkBall():void
		{
			var ball:PinkBall = new PinkBall();
			ball.addToParent(GameManager.getTimeline());
		}
		public static function spawnBrownBall():void
		{
			var ball:BrownBall = new BrownBall();
			ball.addToParent(GameManager.getTimeline());
		}
		public static function spawnGrayBall():void
		{
			var ball:GrayBall = new GrayBall();
			ball.addToParent(GameManager.getTimeline());
		}
		public static function spawnPortal():void
		{
			var portal:Portal = new Portal(50,Math.random()*220+50,Portal.TYPE_EXIT());
			portal.addToParent(GameManager.getTimeline());
		}
		public static function spawnChaoticBall():void
		{
			var ballx:Number = 0;
			var bally:Number = 0;
			var balldir:Number = 0;
			
			if(Math.round(Math.random()*1) == 0)
			{
				ballx = -100;
			}
			else
			{
				ballx = 700;
				balldir = 1;
			}
			
			bally = Math.random()*220+50;
			var ball:ChaoticBall =  new ChaoticBall(ballx,bally,balldir,-1,ChaoticBall.SIZE_LARGE());
			ball.addToParent(GameManager.getTimeline());
		}
		public static function spawnChaoticBomb():void
		{
			var bomb:ChaoticBomb = new ChaoticBomb(Math.random()*450+50,Math.random()*200+50);
			bomb.addToParent(GameManager.getTimeline());
		}
		public static function spawnChaoticBoss():void
		{
			var boss:ChaoticBoss = new  ChaoticBoss();
			boss.addToParent(GameManager.getTimeline());
		}
		public static function spawnWaterBoss():void
		{
			var w:WaterBoss = new WaterBoss();
			w.addToParent(GameManager.getTimeline());
		}
		public static function spawnPaintBrushBoss():void
		{
			var p:PaintBrushBoss = new PaintBrushBoss();
			p.addToParent(GameManager.getTimeline());
		}
		public static function spawnPaintapede():void
		{
			var p:Paintapede = new Paintapede();
			p.addToParent(GameManager.getTimeline());
		}
		public static function setBossSpawned(b:Boolean):void
		{
			bossSpawned = b;
		}
	}
}