package  
{
	public class SplitShotPowerUp extends PowerUp
	{
		public function SplitShotPowerUp(xpos:Number,ypos:Number,c:Boolean = false) 
		{
			super(xpos,ypos,c);
		}
		public override function getClone():Entity
		{
			return new SplitShotPowerUp(x,y,true);
		}
		public override function useEffectOn(p:PlayerBall):void
		{
			AudioManager.playAudio(AudioManager.getPowerUpSound());
			p.activateSplitShot();
			super.useEffectOn(p);
		}
		public override function attachBannerToEntity(e:Entity):void
		{
			banner = new SplitShotBanner(e);
			banner.addToParent(GameManager.getTimeline());
		}
	}
}