package 
{
	public class SecondPaintapedeExplosion extends Explosion
	{
		public function SecondPaintapedeExplosion(entity:PaintapedeHead,c:Boolean = false)
		{
			super(entity,c);
		}
		public override function getClone():Entity
		{
			return new SecondPaintapedeExplosion(null,true);
		}
	}
}