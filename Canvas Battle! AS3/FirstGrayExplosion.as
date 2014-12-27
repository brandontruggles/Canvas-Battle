package  
{
	public class FirstGrayExplosion extends Explosion
	{
		public function FirstGrayExplosion(entity:MiniGrayBall,c:Boolean = false) 
		{
			super(entity,c);
		}
		public override function getClone():Entity
		{
			return new FirstGrayExplosion(null,true);
		}
	}
}