package 
{
	import flash.events.KeyboardEvent;
	import flash.events.Event;
	
	public class Player extends LivingEntity
	{
		protected var keyListener:MultiKeyListener;
		protected var ID:Number;
		
		public function Player(xpos:Number,ypos:Number,h:Number,c:Boolean = false)
		{
			super(xpos,ypos,h,c);
			
			if(GameManager.getGameMode() == 0 || GameManager.getGameMode() == 1)
				ID = 1;
			else
			{
				if(GameManager.getPlayerList().listSize() == 0)
					ID = Math.round(Math.random())+1;
				else
				{
					if((GameManager.getPlayerList().getObject(0) as PlayerBall).getID() == 1)
						ID = 2;
					else
						ID = 1;
				}
			}
			
			if(!clone)
			{
				GameManager.getPlayerList().addObject(this);
				keyListener = new MultiKeyListener(this);
				addEventListener(Event.ADDED_TO_STAGE,initMultiKeyListener);
				addEventListener(Event.ENTER_FRAME,checkKeysDown);
			}
		}
		public function getID():Number
		{
			return ID;
		}
		public override function getClone():Entity
		{
			return new Player(x,y,health,true);
		}
		public function initMultiKeyListener(evt:Event):void
		{
			keyListener.init();
		}
		public function checkKeysDown(evt:Event):void
		{
			
		}
		public override function addToParent(p:Object):void
		{
			super.addToParent(p);
			p.setChildIndex(this,CanvasManager.getCanvasIndex()+2);
		}
		public override function removeListeners():void
		{
			super.removeListeners();
			removeEventListener(Event.ADDED_TO_STAGE,initMultiKeyListener);
			removeEventListener(Event.ENTER_FRAME,checkKeysDown);
		}
		public override function removeFromStage():void
		{
			GameManager.getPlayerList().removeObject(this);
			removeEventListener(Event.ADDED_TO_STAGE,initMultiKeyListener);
			removeEventListener(Event.ENTER_FRAME,checkKeysDown);
			keyListener = null;
			super.removeFromStage();
		}
	}
}