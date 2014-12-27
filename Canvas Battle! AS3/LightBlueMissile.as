package 
{	
	public class LightBlueMissile extends VerticalMissile
	{
		public function LightBlueMissile(ball:LightBlueBall,c:Boolean = false)
		{
			super(ball,ball.getDirection(),12,20,c);
			if(!clone)
				hitRadius = 10;
		}
		public override function getClone():Entity
		{
			return new LightBlueMissile((sourceEntity as LightBlueBall),true);
		}
		public override function checkCollision():void
		{
			for(var i = 0;i<GameManager.getPlayerList().listSize();i++)
			{
				var player:Entity = (GameManager.getPlayerList().getObject(i) as Entity);
				if(hitTestObject((player as PlayerBall).getShield()) && (player as PlayerBall).getShield().visible)
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
			var explosion:LightBlueMissileExplosion = new LightBlueMissileExplosion(this);
			explosion.addToParent(GameManager.getTimeline());
			removeFromStage();
		}
	}
	
}