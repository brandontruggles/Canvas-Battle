package 
{	
	public class CanvasBanner extends PowerUpBanner
	{
		public function CanvasBanner(e:Entity,c:Boolean = false)
		{
			super(e,c);
		}
		public override function getClone():Entity
		{
			return new CanvasBanner(entity,true);
		}
	}
}