package 
{
	import flash.display.MovieClip;
	
	public class AlertMenu extends Entity
	{
		public function AlertMenu(xpos:Number,ypos:Number,c:Boolean = false) 
		{
			super(xpos,ypos,0,0,null,c);
			
			if(!clone)
				GameManager.getMiscList().addObject(this);
		}
		public override function getClone():Entity
		{
			return new AlertMenu(x,y,true);
		}
		public override function removeFromStage():void
		{
			GameManager.getMiscList().removeObject(this);
			super.removeFromStage();
		}
	}
}