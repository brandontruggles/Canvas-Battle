package  
{
	public class TimePowerUp extends PowerUp
	{
		public function TimePowerUp(xpos:Number,ypos:Number,c:Boolean = false) 
		{
			super(xpos,ypos,c);
			
			if(!clone)
			{
				x = xpos-11.95;
				y = ypos+75;
				floatTop = y-floatDistance;
				floatBottom = y+floatDistance;
			}
		}
		public override function getClone():Entity
		{
			return new TimePowerUp(x,y,true);
		}
		public override function useEffectOn(p:PlayerBall):void
		{
			AudioManager.playAudio(AudioManager.getPowerUpSound());
			GameManager.setTimeSlowed(true);
			super.useEffectOn(p);
		}
		public override function attachBannerToEntity(e:Entity):void
		{
			banner = new EnemySlowBanner(e);
			banner.addToParent(GameManager.getTimeline());
		}
	}
}