package  
{	
	import flash.events.Event;
	
	public class EntityFade extends Entity
	{
		public function EntityFade(e:Entity,c:Boolean = false)
		{
			super(e.x,e.y,0,0,null,c);
			var cl:Entity = e.getClone();
			cl.x = 0;
			cl.y = 0;
			cl.rotation = e.rotation;
			addChild(cl);
			
			if(!clone)
				GameManager.getMiscList().addObject(this);
		}
		public override function getClone():Entity
		{
			return new EntityFade(null,true);
		}
		public override function updateTimedVariables(evt:Event):void
		{
			super.updateTimedVariables(evt);
			
			if(!GameManager.gameIsPaused())
			{
				if(alpha>0)
				alpha-=.1;
				else
				removeFromStage();
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
			super.removeFromStage();
		}
	}
}