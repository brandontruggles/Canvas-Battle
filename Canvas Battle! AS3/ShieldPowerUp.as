package  
{
	public class ShieldPowerUp extends PowerUp
	{
		public function ShieldPowerUp(xpos:Number,ypos:Number,c:Boolean = false) 
		{
			super(xpos,ypos,c);
			if(!clone)
				hitRadius = 7.5;
		}
		public override function useEffectOn(p:PlayerBall):void
		{
			AudioManager.playAudio(AudioManager.getPowerUpSound());
			p.getShield().updateHealth(60-p.getShield().getHealth());
			super.useEffectOn(p);
		}
		public override function attachBannerToEntity(e:Entity):void
		{
			banner = new ShieldBanner(e);
			banner.addToParent(GameManager.getTimeline());
		}
	}
}
