package  
{	
	public class FirstBigGrayExplosion extends Explosion
	{
		public function FirstBigGrayExplosion(entity:GrayBall,c:Boolean = false)
		{
			super(entity,c);
		}
		public override function getClone():Entity
		{
			return new FirstBigGrayExplosion(null,true);
		}
	}
}