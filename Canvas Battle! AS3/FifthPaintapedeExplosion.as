package 
{
	public class FifthPaintapedeExplosion extends Explosion
	{
		public function FifthPaintapedeExplosion(entity:PaintapedeHead,c:Boolean = false)
		{
			super(entity,c);
		}
		public override function getClone():Entity
		{
			return new FifthPaintapedeExplosion(null,true);
		}
	}
}