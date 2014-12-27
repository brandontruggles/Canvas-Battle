package 
{	
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.display.MovieClip;
	
	public class ToolTip extends Entity
	{
		private var tText:TextField;
		private var bg:MovieClip;
		
		public function ToolTip(xpos:Number,ypos:Number,s:String,w:Number = 120,h:Number = 25,c:Boolean = false) 
		{
			super(xpos,ypos,0,0,null,c);
			
			if(!clone)
			{
				tText = (getChildByName("tipText") as TextField);
				bg = (getChildByName("tipBackground") as MovieClip);
				tText.text = s;
				tText.width = w;
				tText.height = h;
				bg.width = tText.width;
				bg.height = tText.height;
				tText.x = bg.x-bg.width/2;
				tText.y = bg.y-bg.height/2+2.5;
				GameManager.getMiscList().addObject(this);
			}
		}
		public override function getClone():Entity
		{
			return new ToolTip(x,y,null,120,25,true);
		}
		public override function removeFromStage():void
		{
			GameManager.getMiscList().removeObject(this);
			tText = null;
			bg = null;
			super.removeFromStage();
		}
	}
}