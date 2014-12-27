package  
{
	public class RapidFirePowerUp extends PowerUp
	{
		public function RapidFirePowerUp(xpos:Number,ypos:Number,c:Boolean = false) 
		{
			super(xpos,ypos,c);
		}
		public override function getClone():Entity
		{
			return new RapidFirePowerUp(x,y,true);
		}
		public override function useEffectOn(p:PlayerBall):void
		{
			AudioManager.playAudio(AudioManager.getPowerUpSound());
			p.activateSuperSpeed();
			super.useEffectOn(p);
		}
		public override function attachBannerToEntity(e:Entity):void
		{
			banner = new RapidFireBanner(e);
			banner.addToParent(GameManager.getTimeline());
		}
	}
}