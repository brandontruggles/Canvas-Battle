package 
{	
	public class SplitShotBanner extends PowerUpBanner
	{
		public function SplitShotBanner(e:Entity,c:Boolean = false)
		{
			super(e,c);
		}
		public override function getClone():Entity
		{
			return new SplitShotBanner(null,true);
		}
	}
}