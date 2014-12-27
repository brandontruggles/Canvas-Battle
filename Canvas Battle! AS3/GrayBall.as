package  
{
	import flash.events.Event;

	public class GrayBall extends MiniBoss
	{
		public function GrayBall(c:Boolean = false)
		{
			super(-100,Math.random()*220+50,20,1,0,c);
			
			if(!clone)
			{
				pointValue = 500;
				damage = 40;
				hitRadius = 9.75;
			}
		}
		public override function getClone():Entity
		{
			return new GrayBall(true);
		}
		public override function updateTimedVariables(evt:Event):void
		{
			super.updateTimedVariables(evt);
			
			if(!GameManager.gameIsPaused())
				hitRadius = width/2;
		}
		public override function travel():void
		{
			if(x<700)
				moveRight();
			else
				removeFromStage();
		}
		public override function takeDamage(amount:Number,src:Entity = null):void
		{
			if(currentFrame == 1 || currentFrame == totalFrames)
				super.takeDamage(amount,src);
			else
				spawnMiniGrayBall();
		}
		public function spawnMiniGrayBall():void
		{
			var ball:MiniGrayBall = new MiniGrayBall(this);
			ball.addToParent(parent);
		}
		public function explode():void
		{
			AudioManager.playAudio(AudioManager.getSplatterSoundTwo());
			
			if(GameManager.getCurrentDimension() == GameManager.DIMENSION_NORMAL())
			{
				var portal:Portal = new Portal(x,y,Portal.TYPE_EXIT());
				portal.addToParent(parent);
			}
			var explosionRand:Number = (Math.round(Math.random()))+1;
			if(explosionRand == 1)
			{
				var firstExplosion:FirstBigGrayExplosion = new FirstBigGrayExplosion(this);
				firstExplosion.addToParent(parent);
			}
			else if(explosionRand == 2)
			{
				var secondExplosion:SecondBigGrayExplosion = new SecondBigGrayExplosion(this);
				secondExplosion.addToParent(parent);
			}
		}
		public override function die():void
		{
			explode();
			super.die();
		}
	}
}