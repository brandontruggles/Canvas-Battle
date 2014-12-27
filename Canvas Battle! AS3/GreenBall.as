package 
{
	import flash.events.Event;
	
	public class GreenBall extends Enemy implements ShootingEnabled
	{
		private var shootTimer:Number;
		private var shootLimiter:Number;
		
		public function GreenBall(c:Boolean = false)
		{
			super(700,Math.random()*220+50,20,4,0,c);
			
			if(!clone)
			{
				if(GameManager.getGameMode() == 0)
					x = 800;
				shootTimer = 0;
				
				if(!GameManager.timeIsSlowed())
					shootLimiter = 60;
				else
					shootLimiter = 120;
				
				pointValue = 50;
				damage = 20;
				hitRadius = 10;
			}
		}
		public function getShootLimiter():Number
		{
			return shootLimiter;
		}
		public override function getClone():Entity
		{
			return new GreenBall(true);
		}
		public override function updateTimedVariables(evt:Event):void
		{
			super.updateTimedVariables(evt);
			
			if(!GameManager.gameIsPaused())
			{
				if(shootTimer<shootLimiter)
					shootTimer++;
				else
				{
					shootTimer = 0;
					var missile:GreenMissile = new GreenMissile(this);
					missile.addToParent(GameManager.getTimeline());
				}
			}
		}
		public override function travel():void
		{
			if(x>-100)
				moveLeft();
			else
			{
				if(GameManager.getGameMode() == 0)
					x = 700;
				else
					removeFromStage();
			}
		}
		public function explode():void
		{
			AudioManager.playAudio(AudioManager.getSplatterSoundTwo());
			var explosionRand:Number = (Math.round(Math.random()*2))+1;
			var powerUpRand:Number = (Math.round(Math.random()*4))+1;
			
			if(GameManager.getGameMode()!=0)
			{
				if(powerUpRand == 1)
				{
					if(Math.round(Math.random()*10)<5)
					{
						var hp:HealthPowerUp = new HealthPowerUp(x,y);
						hp.addToParent(GameManager.getTimeline());
					}
				}
				else if(powerUpRand == 2)
				{
					if(Math.round(Math.random()*80)<5)
					{
						var p:PaintBomb = new PaintBomb(x,y);
						p.addToParent(GameManager.getTimeline());
					}
				}
				else if(powerUpRand == 3)
				{
					if(Math.round(Math.random()*20)<5)
					{
						var ps:PlayerSlowPowerUp = new PlayerSlowPowerUp(x,y);
						ps.addToParent(GameManager.getTimeline());
					}
				}
			}
			if(explosionRand == 1)
			{
				var firstExplosion:FirstGreenExplosion = new FirstGreenExplosion(this);
				firstExplosion.addToParent(GameManager.getTimeline());
			}
			else if(explosionRand == 2)
			{
				var secondExplosion:SecondGreenExplosion = new SecondGreenExplosion(this);
				secondExplosion.addToParent(GameManager.getTimeline());
			}
			else if(explosionRand == 3)
			{
				var thirdExplosion:ThirdGreenExplosion = new ThirdGreenExplosion(this);
				thirdExplosion.addToParent(GameManager.getTimeline());
			}
		}
		public function setShootLimiter(n:Number):void
		{
			shootLimiter = n;
		}
		public override function die():void
		{
			if(GameManager.getGameMode() == 0)
				TutorialManager.changeMessages();
			explode();
			super.die();
		}
	}
}