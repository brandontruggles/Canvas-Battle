package  
{	
	import flash.text.TextField;
	import flash.events.KeyboardEvent;
	
	public class AssignMenu extends AlertMenu
	{
		private var wMessage:TextField;
		private var kDescription:TextField;
		
		public function AssignMenu(desc:String,c:Boolean = false)
		{
			super(300,150,c);
			
			if(!clone)
			{
				wMessage = (getChildByName("warningMessage") as TextField);
				kDescription = (getChildByName("keyDescription") as TextField);
				kDescription.text = desc;
				wMessage.visible = false;
			}
		}
		public function isShowingWarning():Boolean
		{
			return wMessage.visible;
		}
		public override function getClone():Entity
		{
			return new AssignMenu(kDescription.text,true);
		}
		public function showWarning(key:Number):void
		{
			wMessage.visible = true;
			
			if(key == ControlsManager.getP1LeftKey())
				wMessage.text = "The key you pressed is already the P1 Left key!";
			else if(key == ControlsManager.getP1UpKey())
				wMessage.text = "The key you pressed is already the P1 Up key!";
			else if(key == ControlsManager.getP1RightKey())
				wMessage.text = "The key you pressed is already the P1 Right key!";
			else if(key == ControlsManager.getP1DownKey())
				wMessage.text = "The key you pressed is already the P1 Down key!";
			else if(key == ControlsManager.getP1ShootKey())
				wMessage.text = "The key you pressed is already the P1 Shoot key!";
			else if(key == ControlsManager.getP1ShieldKey())
				wMessage.text = "The key you pressed is already the P1 Shield key!";
			else if(key == ControlsManager.getPauseKey())
				wMessage.text = "The key you pressed is already the Pause key!";
			else if(key == ControlsManager.getCanvasKey())
				wMessage.text = "The key you pressed is already the Canvas key!";
			else if(key == ControlsManager.getP2LeftKey())
				wMessage.text = "The key you pressed is already the P2 Left Key!";
			else if(key == ControlsManager.getP2UpKey())
				wMessage.text = "The key you pressed is already the P2 Up Key!";
			else if(key == ControlsManager.getP2RightKey())
				wMessage.text = "The key you pressed is already the P2 Right Key!";
			else if(key == ControlsManager.getP2DownKey())
				wMessage.text = "The key you pressed is already the P2 Down Key!";
			else if(key == ControlsManager.getP2ShootKey())
				wMessage.text = "The key you pressed is already the P2 Shoot Key!";
			else if(key == ControlsManager.getP2ShieldKey())
				wMessage.text = "The key you pressed is already the P2 Shield Key!";
		}
	}
}