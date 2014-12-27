package 
{	
	import flash.events.Event;
	
	public class PointerArrow extends Entity
	{
		private var startX:Number;
		private var startY:Number;
		private var direct:Number;
		private var hitEnd:Boolean;
		
		public function PointerArrow(xpos:Number,ypos:Number,dir:Number,c:Boolean = false) 
		{
			super(xpos,ypos,0,0,null,c);
			
			if(dir == 0)
				rotation = 90;
			else if(dir == 1)
				rotation = 180;
			else if(dir == 2)
				rotation = 270;
			startX = x;
			startY = y;
			direct = dir;
			hitEnd = false;
			if(!clone)
				GameManager.getMiscList().addObject(this);
		}
		public override function getClone():Entity
		{
			return new PointerArrow(x,y,direct,true);
		}
		public override function updateTimedVariables(evt:Event):void
		{
			super.updateTimedVariables(evt);
			
			if(!GameManager.gameIsPaused())
			{
				if(direct == 0)
				{
					if(x>startX-20 && !hitEnd)
						x-=2;
					else if(x<=startX-20 && !hitEnd)
						hitEnd = true;
					
					if(x<startX && hitEnd)
						x+=2;
					else if(x>=startX && hitEnd)
						hitEnd = false;
				}
				else if(direct == 1)
				{
					if(y>startY-20 && !hitEnd)
						y-=2;
					else if(y<=startY-20 && !hitEnd)
						hitEnd = true;
					
					if(y<startY && hitEnd)
						y+=2;
					else if(y>=startY && hitEnd)
						hitEnd = false;
				}
				else if(direct == 2)
				{
					if(x<startX+20 && !hitEnd)
						x+=2;
					else if(x>=startX+20 && !hitEnd)
						hitEnd = true;
					
					if(x>startX && hitEnd)
						x-=2;
					else if(x<=startX && hitEnd)
						hitEnd = false;
				}
				else if(direct == 3)
				{
					if(y<startY+20 && !hitEnd)
						y+=2;
					else if(y>=startY+20 && !hitEnd)
						hitEnd = true;
					
					if(y>startY && hitEnd)
						y-=2;
					else if(y<=startY && hitEnd)
						hitEnd = false;
				}
			}
		}
		public override function removeFromStage():void
		{
			GameManager.getMiscList().removeObject(this);
			super.removeFromStage();
		}
	}
}