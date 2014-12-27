package
{
	public class ThirdLightBlueExplosion extends Explosion
	{
		public function ThirdLightBlueExplosion(entity:LightBlueBall,c:Boolean = false)
		{
			super(entity,c);
		}
		public override function getClone():Entity
		{
			return new ThirdLightBlueExplosion(null,true);
		}
	}
}