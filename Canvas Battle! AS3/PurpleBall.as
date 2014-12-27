package 
{
	import flash.events.Event;
	
	public class PurpleBall extends Enemy
	{
		public function PurpleBall(c:Boolean = false) 
		{
			super(-100,Math.random()*220+50,20,8,0,c);
			pointValue = 100;
			damage = 20;
			hitRadius = 13.5;
		}
		public override function getClone():Entity
		{
			return new PurpleBall(true);
		}
		public override function travel():void
		{
			if(x<700)
				moveRight();
			else
				removeFromStage();
		}
		public function explode():void
		{
			AudioManager.playAudio(AudioManager.getSplatterSoundTwo());
			var explosionRand:Number = (Math.round(Math.random()*2))+1;
			var powerUpRand:Number = (Math.round(Math.random()*4))+1;
			if(powerUpRand == 1)
			{
				var s:SplitShotPowerUp = new SplitShotPowerUp(x,y);
				s.addToParent(parent);
			}
			else if(powerUpRand == 2)
			{
				if(Math.round(Math.random()*80)<20)
				{
					var p:PaintBomb = new PaintBomb(x,y);
					p.addToParent(GameManager.getTimeline());
				}
			}
			if(explosionRand == 1)
			{
				var firstExplosion:FirstPurpleExplosion = new FirstPurpleExplosion(this);
				firstExplosion.addToParent(GameManager.getTimeline());
			}
			else if(explosionRand == 2)
			{
				var secondExplosion:SecondPurpleExplosion = new SecondPurpleExplosion(this);
				secondExplosion.addToParent(GameManager.getTimeline());
			}
			else if(explosionRand == 3)
			{
				var thirdExplosion:ThirdPurpleExplosion = new ThirdPurpleExplosion(this);
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