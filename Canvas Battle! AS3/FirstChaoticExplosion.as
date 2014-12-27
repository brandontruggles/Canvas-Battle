package  
{	
	public class FirstChaoticExplosion extends Explosion
	{
		public function FirstChaoticExplosion(entity:ChaoticBall,c:Boolean = false)
		{
			super(entity,c);
		}
		public override function getClone():Entity
		{
			return new FirstChaoticExplosion(null,true);
		}
	}
}