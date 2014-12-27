package
{
	public class SecondGreenExplosion extends Explosion
	{
		public function SecondGreenExplosion(entity:GreenBall,c:Boolean = false)
		{
			super(entity,c);
		}
		public override function getClone():Entity
		{
			return new SecondGreenExplosion(null,true);
		}
	}
}