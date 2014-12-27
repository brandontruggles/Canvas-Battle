package  
{
	import flash.events.Event;
	
	public class EnemyEgg extends Enemy
	{
		public function EnemyEgg(xpos:Number,ypos:Number,c:Boolean = false)
		{
			super(xpos,ypos,20,0,0,c);
		}
		public override function getClone():Entity
		{
			return new EnemyEgg(x,y,true);
		}
		public override function updateTimedVariables(evt:Event):void
		{
			super.updateTimedVariables(evt);
			if(!GameManager.gameIsPaused())
			{
				if(currentFrame == totalFrames)
					hatch();
			}
		}
		public function hatch():void
		{
			AudioManager.playAudio(AudioManager.getEggHatchSound());
			explode();
		}
		public override function die():void
		{
			explode();
			super.die();
		}
		public function explode():void
		{
			removeFromStage();
		}
	}
}