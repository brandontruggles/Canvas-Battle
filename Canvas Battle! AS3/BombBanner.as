package 
{	
	public class BombBanner extends PowerUpBanner
	{
		public function BombBanner(e:Entity,c:Boolean = false) 
		{
			super(e,c);
		}
		public override function getClone():Entity
		{
			return new BombBanner(entity,true);
		}
	}
}