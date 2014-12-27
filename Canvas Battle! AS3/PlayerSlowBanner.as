package 
{	
	public class PlayerSlowBanner extends PowerUpBanner
	{
		public function PlayerSlowBanner(e:Entity,c:Boolean = false) 
		{
			super(e,c);
		}
		public override function getClone():Entity
		{
			return new PlayerSlowBanner(null,true);
		}
	}
}