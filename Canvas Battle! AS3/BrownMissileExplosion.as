package  
{	
	public class BrownMissileExplosion extends Explosion
	{
		public function BrownMissileExplosion(entity:BrownMissile,c:Boolean = false)
		{
			super(entity,c);
			rotation = entity.rotation;
		}
		public override function getClone():Entity
		{
			return new BrownMissileExplosion(null,true);
		}
	}
}