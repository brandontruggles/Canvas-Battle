package 
{	
	public class ShieldBanner extends PowerUpBanner
	{
		public function ShieldBanner(e:Entity,c:Boolean = false) 
		{
			super(e,c);
		}
		public override function getClone():Entity
		{
			return new ShieldBanner(null,true);
		}
	}
}