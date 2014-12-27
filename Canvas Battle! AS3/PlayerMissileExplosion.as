package  
{	
	public class PlayerMissileExplosion extends Explosion
	{
		public function PlayerMissileExplosion(m:PlayerMissile,c:Boolean = false) 
		{
			super(m,c);
			rotation = m.rotation;
			fillWithColor(m.getColor());
		}
		public override function getClone():Entity
		{
			return new PlayerMissileExplosion(null,true);
		}
	}
}