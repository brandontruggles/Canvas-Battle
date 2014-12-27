package  
{	
	public class GreenMissileExplosion extends Explosion
	{
		public function GreenMissileExplosion(entity:GreenMissile,c:Boolean = false)
		{
			super(entity,c);
		}
		public override function getClone():Entity
		{
			return new GreenMissileExplosion(null,true);
		}
	}
}