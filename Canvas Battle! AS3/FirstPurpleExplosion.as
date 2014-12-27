package
{
	public class FirstPurpleExplosion extends Explosion
	{
		public function FirstPurpleExplosion(entity:PurpleBall,c:Boolean = false)
		{
			super(entity,c);
		}
		public override function getClone():Entity
		{
			return new FirstPurpleExplosion(null,true);
		}
	}
}