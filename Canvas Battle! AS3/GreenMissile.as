package
{
	public class GreenMissile extends BasicMissile
	{
		public function GreenMissile(ball:GreenBall,c:Boolean = false) 
		{
			super(ball,0,12,20,c);
			if(!clone)
				hitRadius = 10;
		}
		public override function getClone():Entity
		{
			return new GreenMissile((sourceEntity as GreenBall),true);
		}
		public override function checkCollision():void
		{
			for(var i = 0;i<GameManager.getPlayerList().listSize();i++)
			{
				var player:Entity = (GameManager.getPlayerList().getObject(i) as Entity);
				
				if(hittingEntity((player as PlayerBall).getShield()) && (player as PlayerBall).getShield().visible && !(player as PlayerBall).isInvulnerable())
				{
					explode();
					(player as PlayerBall).getShield().takeDamage(damage);
				}
				if(hittingEntity(player) && !(player as PlayerBall).isInvulnerable())
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
			var explosion:GreenMissileExplosion = new GreenMissileExplosion(this);
			explosion.addToParent(GameManager.getTimeline());
			removeFromStage();
		}
	}
}