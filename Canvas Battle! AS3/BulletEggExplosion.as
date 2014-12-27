package  
{	
	public class BulletEggExplosion extends Explosion
	{
		public function BulletEggExplosion(entity:BulletEgg,c:Boolean = false)
		{
			super(entity);
		}
		public override function getClone():Entity
		{
			return new BulletEggExplosion(null,true);
		}
	}
}