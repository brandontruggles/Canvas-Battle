package  
{	
	public class FirstBrownExplosion extends Explosion
	{
		public function FirstBrownExplosion(e:BrownBall,c:Boolean = false)
		{
			super(e,c);
		}
		public override function getClone():Entity
		{
			return new FirstBrownExplosion(null,true);
		}
	}
}