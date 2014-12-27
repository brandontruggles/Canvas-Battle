package 
{
	import flash.events.Event;
	
	public class MiniGrayBall extends Enemy
	{
		private var vertiDir:Number;
		private var horizDir:Number;
		
		public function MiniGrayBall(entity:Entity,c:Boolean = false)
		{
			super(entity.x,entity.y,20,4,4,c);
			
			if(!clone)
			{
				pointValue = 25;
				damage = 10;
				hitRadius = 11;
				vertiDir = Math.round(Math.random()*1);
				horizDir = 0;
			}
		}
		public override function getClone():Entity
		{
			return new MiniGrayBall(this,true);
		}
		public override function travel():void
		{
			if(vertiDir == 0)
			{
				if(y<270)
					moveDown();
				else
					vertiDir = 1;
			}
			else if(vertiDir == 1)
			{
				if(y>50)
					moveUp();
				else
					vertiDir = 0;
			}
			if(horizDir == 0)
			{
				if(x>10)
					moveLeft();
				else
					horizDir = 1;
			}
			else if(horizDir == 1)
			{
				if(x<590)
					moveRight();
				else
					horizDir = 0;
			}
		}
		public function explode():void
		{
			AudioManager.playAudio(AudioManager.getSplatterSoundTwo());
			var explosionRand:Number = (Math.round(Math.random()*2))+1;
			
			if(explosionRand == 1)
			{
				var firstExplosion:FirstGrayExplosion = new FirstGrayExplosion(this);
				firstExplosion.addToParent(parent);
			}
			else if(explosionRand == 2)
			{
				var secondExplosion:SecondGrayExplosion = new SecondGrayExplosion(this);
				secondExplosion.addToParent(parent);
			}
			else if(explosionRand == 3)
			{
				var thirdExplosion:ThirdGrayExplosion = new ThirdGrayExplosion(this);
				thirdExplosion.addToParent(parent);
			}
		}
		public override function die():void
		{
			explode();
			super.die();
		}
	}
}