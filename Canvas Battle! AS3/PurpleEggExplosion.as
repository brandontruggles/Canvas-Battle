package 
{
	public class PurpleEggExplosion extends Explosion
	{
		public function PurpleEggExplosion(entity:PurpleEgg,c:Boolean = false) 
		{
			super(entity,c);
		}
		public override function getClone():Entity
		{
			return new PurpleEggExplosion(null,true);
		}
	}
}