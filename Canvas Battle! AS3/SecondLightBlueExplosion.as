package
{
	public class SecondLightBlueExplosion extends Explosion
	{
		public function SecondLightBlueExplosion(entity:LightBlueBall,c:Boolean = false)
		{
			super(entity,c);
		}
		public override function getClone():Entity
		{
			return new SecondLightBlueExplosion(null,true);
		}
	}
}