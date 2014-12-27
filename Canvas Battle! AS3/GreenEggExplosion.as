package 
{	
	public class GreenEggExplosion extends Explosion
	{
		public function GreenEggExplosion(entity:GreenEgg,c:Boolean = false)
		{
			super(entity,c);
		}
		public override function getClone():Entity
		{
			return new GreenEggExplosion(null,true);
		}
	}
}