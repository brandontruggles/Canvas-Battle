package
{
	public class SecondPurpleExplosion extends Explosion
	{
		public function SecondPurpleExplosion(entity:PurpleBall,c:Boolean = false)
		{
			super(entity,c);
		}
		public override function getClone():Entity
		{
			return new SecondPurpleExplosion(null,true);
		}
	}
}