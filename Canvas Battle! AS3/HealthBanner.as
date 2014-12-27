package 
{	
	public class HealthBanner extends PowerUpBanner
	{
		public function HealthBanner(e:Entity,c:Boolean = false)
		{
			super(e,c);
		}
		public override function getClone():Entity
		{
			return new HealthBanner(entity,true);
		}
	}
}