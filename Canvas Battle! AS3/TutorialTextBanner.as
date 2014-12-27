package 
{
	import flash.events.Event;
	import flash.text.TextField;
	import fl.motion.Color;
	
	public class TutorialTextBanner extends Entity
	{
		private var tutText:TextField;
		
		public function TutorialTextBanner(c:Boolean = false) 
		{
			super(300,160,0,0,null,c);
			
			if(!clone)
			{
				tutText = (getChildByName("tutorialText") as TextField);
				tutText.text = TutorialManager.getCurrentMessage().getMsg();
				GameManager.getMiscList().addObject(this);
			}
		}
		public override function getClone():Entity
		{
			return new TutorialTextBanner(true);
		}
		public override function updateTimedVariables(evt:Event):void
		{
			super.updateTimedVariables(evt);
			
			if(!GameManager.gameIsPaused())
			{
				if(TutorialManager.getCurrentMessage()!=null)
					tutText.text = TutorialManager.getCurrentMessage().getMsg();
				else
					removeFromStage();
			}
		}
		public override function removeFromStage():void
		{
			if(GameManager.gameIsActive())
			{
				var checkm:Checkmark = new Checkmark();
				checkm.addToParent(GameManager.getTimeline());
			}
			GameManager.getMiscList().removeObject(this);
			tutText = null;
			super.removeFromStage();
		}
	}
}