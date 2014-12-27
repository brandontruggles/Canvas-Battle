package 
{
	public class FourthPaintapedeExplosion extends Explosion
	{
		public function FourthPaintapedeExplosion(entity:PaintapedeHead,c:Boolean = false)
		{
			super(entity,c);
		}
		public override function getClone():Entity
		{
			return new FourthPaintapedeExplosion(null,true);
		}
	}
}