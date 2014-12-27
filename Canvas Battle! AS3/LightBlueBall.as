package 
{
	import flash.events.Event;

	public class LightBlueBall extends Enemy implements ShootingEnabled
	{
		private var dir:Number;
		private var shootTimer:Number;
		private var shootLimiter:Number;
		
		public function LightBlueBall(c:Boolean = false)
		{
			super(Math.random()*500+50,-100,20,0,4,c);
			
			if(!clone)
			{
				dir = Math.round(Math.random()*1);
				shootTimer = 0;
				hitRadius = 10;
			
				if(!GameManager.timeIsSlowed())
				{
					if(GameManager.getDifficulty() == 1)
						shootLimiter = 60;
					else if(GameManager.getDifficulty() == 2)
						shootLimiter = 45;
					else if(GameManager.getDifficulty() == 3)
						shootLimiter = 30;
				}
				else
				{
					if(GameManager.getDifficulty() == 1)
						shootLimiter = 120;
					else if(GameManager.getDifficulty() == 2)
						shootLimiter = 90;
					else if(GameManager.getDifficulty() == 3)
						shootLimiter = 60;
				}
				
				pointValue = 75;
				damage = 20;
				if(dir == 0)
				y = 400;
			}
		}
		public function getDirection():Number
		{
			return dir;
		}
		public function getShootLimiter():Number
		{
			return shootLimiter;
		}
		public override function getClone():Entity
		{
			return new LightBlueBall(true);
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
					var missile:LightBlueMissile = new LightBlueMissile(this);
					missile.addToParent(GameManager.getTimeline());
				}
			}
		}
		public override function travel():void
		{
			if(dir == 0)
				moveUp();
			else if(dir == 1)
				moveDown();
			
			if(y>700 || y<-100)
				removeFromStage();
		}
		public function setShootLimiter(n:Number):void
		{
			shootLimiter = n;
		}
		public function explode():void
		{
			AudioManager.playAudio(AudioManager.getSplatterSoundTwo());
			var powerUpRand:Number = (Math.round(Math.random()*4))+1;
			var explosionRand:Number = (Math.round(Math.random()*2))+1;
			if(powerUpRand == 1)
			{
				var rFire:RapidFirePowerUp = new RapidFirePowerUp(x,y);
				rFire.addToParent(GameManager.getTimeline());
			}
			if(explosionRand == 1)
			{
				var firstExplosion:FirstLightBlueExplosion = new FirstLightBlueExplosion(this);
				firstExplosion.addToParent(GameManager.getTimeline());
			}
			else if(explosionRand == 2)
			{
				var secondExplosion:SecondLightBlueExplosion = new SecondLightBlueExplosion(this);
				secondExplosion.addToParent(GameManager.getTimeline());
			}
			else if(explosionRand == 3)
			{
				var thirdExplosion:ThirdLightBlueExplosion = new ThirdLightBlueExplosion(this);
				thirdExplosion.addToParent(GameManager.getTimeline());
			}
		}
		public override function die():void
		{
			explode();
			super.die();
		}
	}
}