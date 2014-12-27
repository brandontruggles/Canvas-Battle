package 
{	
	import flash.events.Event;

	public class ChaoticBall extends Enemy 
	{
		private var horizDir:Number;
		private var vertiDir:Number;
		private var size:Number;
		
		public function ChaoticBall(xpos:Number,ypos:Number,d1:Number,d2:Number,s:Number,c:Boolean = false) 
		{
			super(xpos,ypos,20,8,12,c);
			
			if(!clone)
			{
				damage = 20;
				horizDir = d1;
				vertiDir = d2;
				size = s;
				var bossPresent:Boolean = false;
				for(var i = 0;i<GameManager.getEnemyList().listSize();i++)
				{
					var e:Entity = (GameManager.getEnemyList().getObject(i) as Entity);
					if(e is ChaoticBoss)
						bossPresent = true;
				}
				if(Math.round(Math.random()*2) == 0 && !bossPresent)
					AudioManager.playAudio(AudioManager.getChaoticGrowlSound());
			}
			
			if(size == SIZE_SMALL())
			{
				width = 20;
				height = 20;
				hitRadius = 10;
				pointValue = 200;
			}
			else if(size == SIZE_MEDIUM())
			{
				width = 30;
				height = 30;
				hitRadius = 15;
				pointValue = 100;
			}
			else if(size == SIZE_LARGE())
			{
				width = 40;
				height = 40;
				hitRadius = 20;
				pointValue = 50;
			}
		}
		public static function SIZE_LARGE():Number
		{
			return 2;
		}
		public static function SIZE_MEDIUM():Number
		{
			return 1;
		}
		public static function SIZE_SMALL():Number
		{
			return 0;
		}
		public override function getClone():Entity
		{
			return new ChaoticBall(x,y,horizDir,vertiDir,size,true);
		}
		public override function travel():void
		{
			if(horizDir == 0)
			{
				if(x<700)
					moveRight();
				else
					removeFromStage();
			}
			else if(horizDir == 1)
			{
				if(x>-100)
					moveLeft();
				else
					removeFromStage();
			}
			if(vertiDir == 0)
			{
				if(y>50)
					moveUp();
				else if((horizDir == 0 || horizDir == 1))
					vertiDir = 1;
				else if(!(horizDir == 0 || horizDir == 1) && y>-100)
					moveUp();
				else
					removeFromStage();
			}
			else if(vertiDir == 1)
			{
				if(y<270)
					moveDown();
				else if((horizDir == 0 || horizDir ==1))
					vertiDir = 0;
				else if(!(horizDir == 0 || horizDir == 1) && y<400)
					moveDown();
				else
					removeFromStage();
			}
		}
		public function split():void
		{
			var nextLowerSize:Number = -1;
			if(size == SIZE_MEDIUM())
				nextLowerSize = SIZE_SMALL();
			else if(size == SIZE_LARGE())
				nextLowerSize = SIZE_MEDIUM();
			
			if(nextLowerSize!=-1)
			{
				var b1:ChaoticBall = new ChaoticBall(x,y-size/2,horizDir,0,nextLowerSize);
				var b2:ChaoticBall = new ChaoticBall(x,y+size/2,horizDir,1,nextLowerSize);
				b1.addToParent(parent);
				b2.addToParent(parent);
			}
		}
		public override function moveUp():void
		{
			y-=yVelocity/4;
		}
		public override function moveDown():void
		{
			y+=yVelocity/4;
		}
		public function explode():void
		{
			AudioManager.playAudio(AudioManager.getSplatterSoundTwo());
			var explosionRand:Number = (Math.round(Math.random()))+1;
			var powerUpRand:Number = Math.round(Math.random()*6);
			
			if(powerUpRand == 0)
			{
				var h:HealthPowerUp = new HealthPowerUp(x,y);
				h.addToParent(GameManager.getTimeline());
			}
			if(explosionRand == 1)
			{
				var firstExplosion:FirstChaoticExplosion = new FirstChaoticExplosion(this);
				firstExplosion.addToParent(GameManager.getTimeline());
			}
			else if(explosionRand == 2)
			{
				var secondExplosion:SecondChaoticExplosion = new SecondChaoticExplosion(this);
				secondExplosion.addToParent(GameManager.getTimeline());
			}
			split();
		}
		public override function die():void
		{
			explode();
			super.die();
		}
	}
}