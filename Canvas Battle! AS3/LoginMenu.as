package 
{
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	import flash.display.MovieClip;
	import flash.ui.Mouse;
	import flash.text.TextField;

	public class LoginMenu extends AlertMenu
	{
		private var cButton:SimpleButton;
		private var lButton:SimpleButton;
		private var cBox:MovieClip;
		private var rBox:TextField;
		
		public function LoginMenu(c:Boolean = false) 
		{
			super(300,150,c);
			
			if(!clone)
			{
				cButton = (getChildByName("closeButton") as SimpleButton);
				lButton = (getChildByName("loginButton") as SimpleButton);
				cBox = (getChildByName("checkBox") as MovieClip);
				rBox = (getChildByName("reminderText") as TextField);
			}
			
			rBox.addEventListener(MouseEvent.MOUSE_OVER,changeMouse);
			rBox.addEventListener(MouseEvent.MOUSE_OUT,revertMouse);
			rBox.addEventListener(MouseEvent.CLICK,changeBox);
			cBox.addEventListener(MouseEvent.MOUSE_OVER,changeMouse);
			cBox.addEventListener(MouseEvent.MOUSE_OUT,revertMouse);
			cBox.addEventListener(MouseEvent.CLICK,changeBox);
			cButton.addEventListener(MouseEvent.CLICK,exit);
			lButton.addEventListener(MouseEvent.CLICK,login);
		}
		public override function getClone():Entity
		{
			return new LoginMenu(true);
		}
		public function changeMouse(evt:MouseEvent):void
		{
			Mouse.cursor = "button";
		}
		public function revertMouse(evt:MouseEvent):void
		{
			Mouse.cursor = "auto";
		}
		public function changeBox(evt:MouseEvent):void
		{
			if(cBox.currentFrame == 1)
				cBox.gotoAndStop(2);
			else if(cBox.currentFrame == 2)
				cBox.gotoAndStop(1);
		}
		public function login(evt:MouseEvent):void
		{
			APIManager.showRegistrationBox();
		}
		public function exit(evt:MouseEvent):void
		{
			if(cBox.currentFrame == 2)
				GameManager.setLoginReminder(false);
			removeFromStage();
		}
		public override function removeFromStage():void
		{
			rBox.removeEventListener(MouseEvent.MOUSE_OVER,changeMouse);
			rBox.removeEventListener(MouseEvent.MOUSE_OUT,revertMouse);
			rBox.removeEventListener(MouseEvent.CLICK,changeBox);
			cBox.removeEventListener(MouseEvent.MOUSE_OVER,changeMouse);
			cBox.removeEventListener(MouseEvent.MOUSE_OUT,revertMouse);
			cBox.removeEventListener(MouseEvent.CLICK,changeBox);
			cButton.removeEventListener(MouseEvent.CLICK,exit);
			lButton.removeEventListener(MouseEvent.CLICK,login);
			
			rBox = null;
			cBox = null;
			cButton = null;
			lButton = null;
			super.removeFromStage();
		}
	}
}
