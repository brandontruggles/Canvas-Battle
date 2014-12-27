package 
{
	import flash.events.Event;
	import flash.geom.ColorTransform;
	
	public class MiniHealthBar extends HealthBar
	{
		private var visibilityCounter:Number;
		private var originalEntityWidth:Number;
		private var originalEntityHeight:Number;
		
		public function MiniHealthBar(entity:LivingEntity,s:Number,c:Boolean = false) 
		{
			super(entity.x-entity.width/2-entity.getHealth()/s/2,entity.y-entity.height/2-10,entity,s,new ColorTransform(0,0,0,1,0,256,0),c);
			if(!clone)
			{
				height = 5;
				visible = false;
				visibilityCounter = 0;
				originalEntityWidth = entity.width;
				originalEntityHeight = entity.height;
			}
		}
		public override function getClone():Entity
		{
			return new MiniHealthBar((parentEntity as LivingEntity),scale,true);
		}
		public override function updateTimedVariables(evt:Event):void
		{
			super.updateTimedVariables(evt);
			
			if(!GameManager.gameIsPaused())
			{
				updateEntityLocation();
				updateSize(0);
				
				if(visible)
				{
					if(visibilityCounter<120)
						visibilityCounter++;
					else
						visible = false;
				}
				
			}
		}
		public function updateVisibility():void
		{
			if(!visible)
				visible = true;
				
			visibilityCounter = 0;
		}
		public function updateEntityLocation():void
		{
			if(parentEntity is PlayerShield)
			{
				x = parentEntity.x-originalEntityWidth/2-parentEntity.getHealth()/scale/2;
				y = parentEntity.y-originalEntityHeight/2-10;
			}
			else
			{
				x = parentEntity.x-parentEntity.width/2-parentEntity.getHealth()/scale/2;
				y = parentEntity.y-parentEntity.height/2-10;
			}
		}
		public override function addToParent(p:Object):void
		{
			super.addToParent(p);
			p.setChildIndex(this,CanvasManager.getCanvasIndex()+2);
		}
	}
}