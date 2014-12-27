package  
{
	public class SecondGrayExplosion extends Explosion
	{
		public function SecondGrayExplosion(entity:MiniGrayBall,c:Boolean = false) 
		{
			super(entity,c);
		}
		public override function getClone():Entity
		{
			return new SecondGrayExplosion(null,true);
		}
	}
}