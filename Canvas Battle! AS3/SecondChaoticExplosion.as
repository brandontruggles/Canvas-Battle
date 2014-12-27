package  
{	
	public class SecondChaoticExplosion extends Explosion
	{
		public function SecondChaoticExplosion(entity:ChaoticBall,c:Boolean = false)
		{
			super(entity,c);
		}
		public override function getClone():Entity
		{
			return new SecondChaoticExplosion(null,true);
		}
	}
}