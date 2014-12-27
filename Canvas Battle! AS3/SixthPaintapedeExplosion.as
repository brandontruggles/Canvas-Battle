package 
{
	public class SixthPaintapedeExplosion extends Explosion
	{
		public function SixthPaintapedeExplosion(entity:PaintapedeHead,c:Boolean = false)
		{
			super(entity,c);
		}
		public override function getClone():Entity
		{
			return new SixthPaintapedeExplosion(null,true);
		}
	}
}