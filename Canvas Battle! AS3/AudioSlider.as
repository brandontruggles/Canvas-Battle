package 
{	
	import flash.display.MovieClip;
	import flash.text.TextField;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;
	import flash.utils.getQualifiedClassName;
	
	public class AudioSlider extends MovieClip
	{
		private var sButton:MovieClip;
		private var line:MovieClip;
		private var slider:MovieClip;
		private var sText:TextField;
		private var percentage:Number;
		private var mDown:Boolean;
		
		public function AudioSlider()
		{
			mDown = false;
			sButton = (getChildByName("sliderButton") as MovieClip);
			line = (getChildByName("sliderLine") as MovieClip);
			slider = (getChildByName("sliderBar") as MovieClip);
			sText = (getChildByName("sliderText") as TextField);
			sButton.addEventListener(MouseEvent.CLICK,toggleMute);
			line.addEventListener(MouseEvent.CLICK,processLineClick);
			line.addEventListener(MouseEvent.MOUSE_MOVE,processMouseOn);
			slider.addEventListener(MouseEvent.MOUSE_MOVE,processMouseOn);
			sButton.addEventListener(MouseEvent.MOUSE_MOVE,processMouseOn);
			line.addEventListener(MouseEvent.MOUSE_OUT,processMouseOff);
			slider.addEventListener(MouseEvent.MOUSE_OUT,processMouseOff);
			sButton.addEventListener(MouseEvent.MOUSE_OUT,processMouseOff);
			slider.addEventListener(MouseEvent.MOUSE_DOWN,processMouseDownOnSlider);
			GameManager.getStage().addEventListener(MouseEvent.MOUSE_UP,processMouseUp);
			GameManager.getStage().addEventListener(MouseEvent.MOUSE_MOVE,processMouseMove);
			
			if(name == "BGSlider")
			{
				percentage = GameManager.getBGPercentage();
				slider.x = line.x+GameManager.getBGPercentage();
			}
			else if(name == "FXSlider")
			{
				percentage = GameManager.getFXPercentage();
				slider.x = line.x+GameManager.getFXPercentage();
			}
			
			if(percentage == 0)
			sButton.gotoAndStop(2);
			
			percentage = Math.round(slider.x-line.x);
			sText.text = percentage + "%";
		}
		private function processMouseOn(evt:MouseEvent):void
		{
			Mouse.cursor = "button";
		}
		private function processMouseOff(evt:MouseEvent):void
		{
			Mouse.cursor = "auto";
		}
		private function processLineClick(evt:MouseEvent):void
		{
			if(parent!=null)
				slider.x = stage.mouseX-x-parent.x;
			
			percentage = Math.round(slider.x-line.x);
			sText.text = percentage + "%";
			
			updateAudio();
			
			if(percentage>0)
				sButton.gotoAndStop(1);
			else
				sButton.gotoAndStop(2);
		}
		private function processMouseDownOnSlider(evt:MouseEvent):void
		{
			if(!mDown)
				mDown = true;
		}
		private function toggleMute(evt:MouseEvent):void
		{
			if(percentage>0)
			{
				slider.x = line.x;
				percentage = Math.round(slider.x-line.x);
				sText.text = percentage + "%";
				sButton.gotoAndStop(2);
			}
			else
			{
				slider.x = line.x+line.width/2;
				percentage = Math.round(slider.x-line.x);
				sText.text = percentage + "%";
				sButton.gotoAndStop(1);
			}
			updateAudio();
		}
		private function processMouseUp(evt:MouseEvent):void
		{
			if(mDown)
				mDown = false;
		}
		private function processMouseMove(evt:MouseEvent):void
		{
			if(mDown)
			{
				if(parent!=null)
				{
					if(stage.mouseX<parent.x+x+line.width/2 && stage.mouseX>parent.x+x-line.width/2)
						slider.x = stage.mouseX-x-parent.x;
					else if(stage.mouseX>parent.x+x+line.width/2)
						slider.x = line.x+line.width;
					else if(stage.mouseX<parent.x+x-line.width/2)
						slider.x = line.x;
				}
				
				percentage = Math.round(slider.x-line.x);
				sText.text = percentage + "%";
				if(percentage>0)
					sButton.gotoAndStop(1);
				else
					sButton.gotoAndStop(2);
				
				updateAudio();
			}
		}
		private function updateAudio():void
		{
			if(name == "BGSlider")
				GameManager.setBGPercentage(percentage);
			else if(name == "FXSlider")
				GameManager.setFXPercentage(percentage);
		}
		public override function toString():String
		{
			return getQualifiedClassName(this) + " @ X: " +x + " Y: " +y;
		}
	}
}