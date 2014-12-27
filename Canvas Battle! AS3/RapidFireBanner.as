package 
{	
	public class RapidFireBanner extends PowerUpBanner
	{
		public function RapidFireBanner(e:Entity,c:Boolean = false)
		{
			super(e,c);
		}
		public override function getClone():Entity
		{
			return new RapidFireBanner(null,true);
		}
	}
}