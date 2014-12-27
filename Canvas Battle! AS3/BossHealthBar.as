package 
{
	import flash.events.Event;
	import flash.geom.ColorTransform;
	
	public class BossHealthBar extends HealthBar
	{
		private var visibilityCounter:Number;
		private var flickering:Boolean;
		private var flickerCounter:Number;
		
		public function BossHealthBar(xpos:Number,ypos:Number,entity:Boss,s:Number,c:Boolean = false) 
		{
			super(xpos,ypos,entity,s,new ColorTransform(0,0,0,1,256,0,0),c);
			height = 15;
			flickering = false;
			flickerCounter = 0;
		}
		public function isFlickering():Boolean
		{
			return flickering;
		}
		public override function getClone():Entity
		{
			return new BossHealthBar(x,y,(parentEntity as Boss),scale,true);
		}
		public override function updateSize(amount:Number):void
		{
			super.updateSize(amount);
			
			if(!flickering)
				flickering = true;
				
			flickerCounter = 0;
		}
		public override function updateTimedVariables(evt:Event):void
		{
			super.updateTimedVariables(evt);
			if(!GameManager.gameIsPaused())
			{
				if(flickering)
				{
					if(color.color == new ColorTransform(0,0,0,1,256,0,0).color)
						color = new ColorTransform(0,0,0,1,256,40,40);
					else
						color = new ColorTransform(0,0,0,1,256,0,0);
					
					if(flickerCounter<10)
						flickerCounter++;
					else
					{
						flickering = false;
						color = new ColorTransform(0,0,0,1,256,0,0);
						flickerCounter = 0;
					}
					fillWithColor(color);
				}
			}
		}
	}
}