package
{
	public class FirstLightBlueExplosion extends Explosion
	{
		public function FirstLightBlueExplosion(entity:LightBlueBall,c:Boolean = false)
		{
			super(entity,c);
		}
		public override function getClone():Entity
		{
			return new FirstLightBlueExplosion(null,true);
		}
	}
}