package 
{
	public class SecondBrownExplosion extends Explosion
	{
		public function SecondBrownExplosion(entity:BrownBall,c:Boolean = false)
		{
			super(entity,c);
		}
		public override function getClone():Entity
		{
			return new SecondBrownExplosion(null,true);
		}
	}
}