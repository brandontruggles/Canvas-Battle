package 
{	
	public class PlayerSlowPowerUp extends PowerUp
	{
		public function PlayerSlowPowerUp(xpos:Number,ypos:Number,c:Boolean = false) 
		{
			super(xpos,ypos,c);
		}
		public override function getClone():Entity
		{
			return new PlayerSlowPowerUp(x,y,true);
		}
		public override function useEffectOn(p:PlayerBall):void
		{
			AudioManager.playAudio(AudioManager.getPowerDownSound());
			p.setSlowed(true);
			super.useEffectOn(p);
		}
		public override function attachBannerToEntity(e:Entity):void
		{
			banner = new PlayerSlowBanner(e);
			banner.addToParent(GameManager.getTimeline());
		}
	}
}