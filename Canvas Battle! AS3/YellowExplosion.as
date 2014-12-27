package  
{	
	public class YellowExplosion extends Explosion
	{
		public function YellowExplosion(e:YellowBall,c:Boolean = false) 
		{
			super(e,c);
		}
		public override function getClone():Entity
		{
			return new YellowExplosion(null,true);
		}
	}
}