package 
{
	public class PinkMissile extends HomingMissile
	{
		public function PinkMissile(entity:PinkBall,c:Boolean = false) 
		{
			super(entity,3,20,120,c);
			if(!clone)
				hitRadius = 7;
		}
		public override function getClone():Entity
		{
			return new PinkMissile((sourceEntity as PinkBall),true);
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
		public override function explode():void
		{
			if(parent!=null)
			{
				var explosion:PinkMissileExplosion = new PinkMissileExplosion(this);
				explosion.addToParent(parent);
			}
			super.explode();
		}
	}
}