package 
{
	import flash.events.KeyboardEvent;
	import flash.events.Event;
	
	public class MultiKeyListener 
	{
		private var targetEntity:Entity;
		private var keyList:ArrayList;
		
		public function MultiKeyListener(e:Entity)
		{
			keyList = new ArrayList();
			targetEntity = e;
		}
		public function init():void
		{
			targetEntity.stage.addEventListener(KeyboardEvent.KEY_DOWN,handleKeyPress);
			targetEntity.stage.addEventListener(KeyboardEvent.KEY_UP,handleKeyRelease);
			targetEntity.stage.focus = targetEntity.stage;
		}
		public function hasKeyDown(key:Number):Boolean
		{
			if(keyList.containsObject(key))
				return true;
			return false;
		}
		public function handleKeyPress(evt:KeyboardEvent):void
		{
			if(!keyList.containsObject(evt.keyCode))
				keyList.addObject(evt.keyCode);
		}
		public function handleKeyRelease(evt:KeyboardEvent):void
		{
			if(keyList.containsObject(evt.keyCode))
				keyList.removeObject(evt.keyCode);
		}
	}
}