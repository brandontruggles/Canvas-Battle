package
{
	public class FirstGreenExplosion extends Explosion
	{
		public function FirstGreenExplosion(entity:GreenBall,c:Boolean = false)
		{
			super(entity,c);
		}
		public override function getClone():Entity
		{
			return new FirstGreenExplosion(null,true);
		}
	}
}