package
{	
	import flash.events.Event;

	public class Checkmark extends Entity
	{
		private var delayCounter:Number;
		
		public function Checkmark(c:Boolean = false)
		{
			super(300,150,0,0,null,c);
			
			if(!clone)
			{
				delayCounter = 0;
				AudioManager.playAudio(AudioManager.getTutorialCompleteSound());
			}
		}
		public override function getClone():Entity
		{
			return new Checkmark(true);
		}
		public override function addToParent(p:Object):void
		{
			super.addToParent(p);
			parent.setChildIndex(this,CanvasManager.getCanvasIndex()+1);
		}
		public override function updateTimedVariables(evt:Event):void
		{
			super.updateTimedVariables(evt);
			if(!GameManager.gameIsPaused())
			{
				if(currentFrame == totalFrames)
				{
					if(alpha>0)
						alpha-=.02;
					else
					{
						if(delayCounter<30)
							delayCounter++;
						else
							removeFromStage();
					}
				}
			}
		}
		public override function removeFromStage():void
		{
			super.removeFromStage();
			
			if(GameManager.getGameMode() == 0)
			{
				GameManager.setTutorialBanner(null);
				GameManager.endCurrentGame();
			}
			
			AudioManager.loopAudio(AudioManager.getTitlescreenMusic());
		}
	}
	
}