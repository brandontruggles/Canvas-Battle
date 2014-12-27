package
{	
	public class EggMissileExplosion extends Explosion
	{
		public function EggMissileExplosion(entity:EggMissile,c:Boolean = false) 
		{
			super(entity,c);
			rotation = entity.rotation;
		}
		public override function getClone():Entity
		{
			return new EggMissileExplosion(null,true);
		}
	}
}