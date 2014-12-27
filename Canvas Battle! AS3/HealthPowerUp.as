package  
{
	public class HealthPowerUp extends PowerUp
	{
		var healthValue:Number;
		
		public function HealthPowerUp(xpos:Number,ypos:Number,c:Boolean = false) 
		{
			super(xpos,ypos,c);

			if(!clone)
			{
				var hRandom:Number = Math.round(Math.random()*1);
				if(hRandom == 0)
					healthValue = 20;
				else
					healthValue = 40;
			}
		}
		public override function useEffectOn(p:PlayerBall):void
		{
			AudioManager.playAudio(AudioManager.getPowerUpSound());
			
			if(p.getHealth()<100 && p.getHealth()+healthValue<=100)
				p.updateHealth(healthValue);
			else if(p.getHealth()<100 && p.getHealth()+healthValue>100)
				p.updateHealth(100-p.getHealth());
				
			super.useEffectOn(p);
		}
		public override function attachBannerToEntity(e:Entity):void
		{
			banner = new HealthBanner(e);
			banner.addToParent(GameManager.getTimeline());
		}
	}
}