package 
{	
	import flash.text.TextField;
	import flash.events.Event;
	import flash.geom.ColorTransform;

	public class ComboFade extends Entity
	{
		private var fText:TextField;
		
		public function ComboFade(xpos:Number,ypos:Number,p:PlayerBall,c:Boolean = false)
		{
			super(xpos,ypos,0,0,null,c);
			
			if(!clone)
			{
				fText = (getChildByName("fadeText") as TextField);
				
				if(p.getColor().redOffset == 0 && p.getColor().greenOffset == 0 && p.getColor().blueOffset == 0)
					fText.textColor = new ColorTransform(0,0,0,1,40,40,40,0).color;
				else
					fText.textColor = p.getColor().color;
					
				fText.text = p.getCombo() + "x Combo!";
				AudioManager.playAudio(AudioManager.getComboSound());
				GameManager.getMiscList().addObject(this);
			}
		}
		public override function getClone():Entity
		{
			return new ComboFade(x,y,null,true);
		}
		public override function updateTimedVariables(evt:Event):void
		{
			super.updateTimedVariables(evt);
			if(!GameManager.gameIsPaused())
			{
				if(alpha>0)
				{
					alpha-=.05;
					y-=1;
				}
				else
					removeFromStage();
			}
		}
		public override function removeFromStage():void
		{
			GameManager.getMiscList().removeObject(this);
			fText = null;
			super.removeFromStage();
		}
	}
}