	package 
{
	import flash.events.Event;
	
	public class PinkBall extends MiniBoss implements ShootingEnabled
	{
		private var movingLeft:Boolean;
		private var shootTimer:Number;
		private var shootLimiter:Number;
		
		public function PinkBall(c:Boolean = false) 
		{
			super(700+Math.random()*100,Math.random()*220+50,100,6,0,c);
			
			if(!clone)
			{
				pointValue = 250;
				damage = 20;
				hitRadius = 15.5;
				shootTimer = 0;
				if(!GameManager.timeIsSlowed())
					shootLimiter = 120+Math.round(Math.random()*60);
				else
					shootLimiter = 240 + Math.round(Math.random()*60);
				movingLeft = true;
			}
		}
		public override function getClone():Entity
		{
			return new PinkBall(true);
		}
		public function getShootLimiter():Number
		{
			return shootLimiter;
		}
		public override function travel():void
		{
			if(x>-100 && movingLeft)
				moveLeft();
			else if(x<=-100 && movingLeft)
				flipDirections();
			
			if(x<700 && !movingLeft)
				moveRight();
			else if(x>=700 && !movingLeft)
				flipDirections();
			
		}
		public function flipDirections():void
		{
			if(movingLeft)
				movingLeft = false;
			else
				movingLeft = true;
			
			y = Math.random()*220+50;
		}
		public function explode():void
		{
			AudioManager.playAudio(AudioManager.getSplatterSoundTwo());
			var explosionRand:Number = (Math.round(Math.random()))+1;
			var powerUpRand:Number = Math.round(Math.random()*1);
			
			if(GameManager.getGameMode()!=0)
			{
				if(powerUpRand == 0)
				{
					var t:TimePowerUp = new TimePowerUp(x,y);
					t.addToParent(GameManager.getTimeline());
				}
				else if(powerUpRand == 1)
				{
					var h:HealthPowerUp = new HealthPowerUp(x,y);
					h.addToParent(GameManager.getTimeline());
				}
			}
			if(explosionRand == 1)
			{
				var firstExplosion:FirstPinkExplosion = new FirstPinkExplosion(this);
				firstExplosion.addToParent(GameManager.getTimeline());
			}
			else if(explosionRand == 2)
			{
				var secondExplosion:SecondPinkExplosion = new SecondPinkExplosion(this);
				secondExplosion.addToParent(GameManager.getTimeline());
			}
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
					var missile:PinkMissile = new PinkMissile(this);
					missile.addToParent(parent);
				}
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