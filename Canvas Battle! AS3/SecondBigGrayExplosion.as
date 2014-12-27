package  
{	
	public class SecondBigGrayExplosion extends Explosion
	{
		public function SecondBigGrayExplosion(entity:GrayBall,c:Boolean = false)
		{
			super(entity,c);
		}
		public override function getClone():Entity
		{
			return new SecondBigGrayExplosion(null,true);
		}
	}
}