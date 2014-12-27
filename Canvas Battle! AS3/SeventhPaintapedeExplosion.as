package 
{
	public class SeventhPaintapedeExplosion extends Explosion
	{
		public function SeventhPaintapedeExplosion(entity:PaintapedeHead,c:Boolean = false)
		{
			super(entity,c);
		}
		public override function getClone():Entity
		{
			return new SeventhPaintapedeExplosion(null,true);
		}
	}
}