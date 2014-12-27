package 
{
	public class ThirdGreenExplosion extends Explosion
	{
		public function ThirdGreenExplosion(entity:GreenBall,c:Boolean = false) 
		{
			super(entity,c);
		}
		public override function getClone():Entity
		{
			return new ThirdGreenExplosion(null,true);
		}
	}
}