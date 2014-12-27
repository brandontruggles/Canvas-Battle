package 
{
	public class ThirdPaintapedeExplosion extends Explosion
	{
		public function ThirdPaintapedeExplosion(entity:PaintapedeHead,c:Boolean = false)
		{
			super(entity,c);
		}
		public override function getClone():Entity
		{
			return new ThirdPaintapedeExplosion(null,true);
		}
	}
}