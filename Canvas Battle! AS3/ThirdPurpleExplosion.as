package
{
	public class ThirdPurpleExplosion extends Explosion
	{
		public function ThirdPurpleExplosion(entity:PurpleBall,c:Boolean = false)
		{
			super(entity,c);
		}
		public override function getClone():Entity
		{
			return new ThirdPurpleExplosion(null,true);
		}
	}
}