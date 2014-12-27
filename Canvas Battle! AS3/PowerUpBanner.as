package 
{
	import flash.events.Event;
	
	public class PowerUpBanner extends Entity
	{
		protected var entity:Entity;
		protected var originalEntityHeight:Number;
		protected var originalHeight:Number;
		
		public function PowerUpBanner(e:Entity,c:Boolean = false)
		{
			super(e.x,e.y-e.height/2-height/2,0,0,null,c);
			entity = e;
			originalEntityHeight = entity.height;
			originalHeight = height;
			if(!clone)
				GameManager.getMiscList().addObject(this);
		}
		public override function getClone():Entity
		{
			return new PowerUpBanner(entity,true);
		}
		public override function updateTimedVariables(evt:Event):void
		{
			super.updateTimedVariables(evt);
			if(!GameManager.gameIsPaused())
			{
				x = entity.x;
				y = entity.y-originalEntityHeight/2-originalHeight/2;
				if(currentFrame == totalFrames)
				{
					if(alpha>0)
						alpha-=.1;
					else
						removeFromStage();
				}
			}
		}
		public override function addToParent(p:Object):void
		{
			super.addToParent(p);
			parent.setChildIndex(this,CanvasManager.getCanvasIndex()+2);
		}
		public override function removeFromStage():void
		{
			GameManager.getMiscList().removeObject(this);
			entity = null;
			super.removeFromStage();
		}
	}
}