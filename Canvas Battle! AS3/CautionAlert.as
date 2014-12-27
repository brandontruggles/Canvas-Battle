package  
{
	import flash.events.Event;

	public class CautionAlert extends Entity
	{
		public function CautionAlert(xpos:Number,ypos:Number,c:Boolean = false) 
		{
			super(xpos,ypos,0,0,null,c);
			if(!clone)
			{
				GameManager.getMiscList().addObject(this);
				stoppingList.addObject(currentFrame);
				stoppingList.addObject(totalFrames);
			}
		}
		public override function updateTimedVariables(evt:Event):void
		{
			super.updateTimedVariables(evt);
			
			if(!GameManager.gameIsPaused())
			{
				if(currentFrame == totalFrames)
				{
					if(alpha>0)
						alpha-=.2;
					else
						removeFromStage();
				}
			}
		}
		public override function addToParent(p:Object):void
		{
			super.addToParent(p);
			p.setChildIndex(this,CanvasManager.getCanvasIndex()+2);
		}
		public override function removeFromStage():void
		{
			super.removeFromStage();
			if(!clone)
				GameManager.getMiscList().removeObject(this);
		}
	}
}
