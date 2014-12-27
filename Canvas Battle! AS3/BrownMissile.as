package  
{	
	public class BrownMissile extends MultiDirectionalMissile
	{
		public function BrownMissile(entity:BrownBall,xVel:Number,yVel:Number,c:Boolean = false)
		{
			super(entity,xVel,yVel,10,c);
			
			if(!clone)
			{
				if(GameManager.timeIsSlowed())
				{
					xVelocity/=2;
					yVelocity/=2;
				}
			}
		}
		public override function getClone():Entity
		{
			return new BrownMissile((sourceEntity as BrownBall),xVelocity,yVelocity,true);
		}
		public override function checkCollision():void
		{
			for(var i = 0;i<GameManager.getPlayerList().listSize();i++)
			{
				var player:Entity = (GameManager.getPlayerList().getObject(i) as Entity);
				if(hitTestObject((player as PlayerBall).getShield()) && (player as PlayerBall).getShield().visible && !(player as PlayerBall).isInvulnerable())
				{
					explode();
					(player as PlayerBall).getShield().takeDamage(damage);
				}
				if(hitTestObject(player) && !(player as PlayerBall).isInvulnerable())
				{
					explode();
					if(!(player as PlayerBall).isShielding())
						(player as PlayerBall).takeDamage(damage);
				}
			}
		}
		public function explode():void
		{
			AudioManager.playAudio(AudioManager.getSplatterSoundOne());
			var explosion:BrownMissileExplosion = new BrownMissileExplosion(this);
			explosion.addToParent(GameManager.getTimeline());
			removeFromStage();
		}
	}
}