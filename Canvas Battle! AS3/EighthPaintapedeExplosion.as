package 
{
	public class EighthPaintapedeExplosion extends Explosion
	{
		public function EighthPaintapedeExplosion(entity:PaintapedeHead,c:Boolean = false)
		{
			super(entity,c);
		}
		public override function getClone():Entity
		{
			return new EighthPaintapedeExplosion(null,true);
		}
	}
}