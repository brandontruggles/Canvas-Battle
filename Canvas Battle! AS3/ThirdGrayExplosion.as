package  
{
	public class ThirdGrayExplosion extends Explosion
	{
		public function ThirdGrayExplosion(entity:MiniGrayBall,c:Boolean = false) 
		{
			super(entity,c);
		}
		public override function getClone():Entity
		{
			return new ThirdGrayExplosion(null,true);
		}
	}
}