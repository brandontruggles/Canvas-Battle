package  
{	
	public class LightBlueMissileExplosion extends Explosion
	{
		public function LightBlueMissileExplosion(entity:LightBlueMissile,c:Boolean = false)
		{
			super(entity,c);
			rotation = entity.rotation;
		}
		public override function getClone():Entity
		{
			return new LightBlueMissileExplosion(null,true);
		}
	}
}