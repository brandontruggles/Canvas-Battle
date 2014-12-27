package 
{
	public class FirstPaintapedeExplosion extends Explosion
	{
		public function FirstPaintapedeExplosion(entity:PaintapedeHead,c:Boolean = false)
		{
			super(entity,c);
		}
		public override function getClone():Entity
		{
			return new FirstPaintapedeExplosion(null,true);
		}
	}
}