package
{
	public class SecondPinkExplosion extends Explosion
	{
		public function SecondPinkExplosion(entity:PinkBall,c:Boolean = false)
		{
			super(entity,c);
		}
		public override function getClone():Entity
		{
			return new SecondPinkExplosion(null,true);
		}
	}
}