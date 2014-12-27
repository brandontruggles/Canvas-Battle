package
{
	public class FirstPinkExplosion extends Explosion
	{
		public function FirstPinkExplosion(entity:PinkBall,c:Boolean = false)
		{
			super(entity,c);
		}
		public override function getClone():Entity
		{
			return new FirstPinkExplosion(null,true);
		}
	}
}