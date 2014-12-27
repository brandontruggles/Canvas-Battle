package  
{
	import flash.geom.ColorTransform;
	import flash.events.Event;

	public class PlayerSpawnEffect extends Explosion
	{
		private var spawnedPlayer:Boolean;
		private var player:PlayerBall;
		
		public function PlayerSpawnEffect(xpos:Number,ypos:Number,c:Boolean = false)
		{
			super(null);
			x = xpos;
			y = ypos;
			spawnedPlayer = false;
			player = new PlayerBall(x,y);
			fillWithColor(player.getColor());
		}
		public override function getClone():Entity
		{
			return new PlayerSpawnEffect(x,y,true);
		}
		public override function updateTimedVariables(evt:Event):void
		{
			super.updateTimedVariables(evt);
			
			if(currentFrame == totalFrames && !spawnedPlayer)
			{
				player.addToParent(GameManager.getTimeline());
				spawnedPlayer = true;
				AudioManager.playAudio(AudioManager.getSplatterSoundTwo());
			}
		}
		public override function removeFromStage():void
		{
			player = null;
			super.removeFromStage();
		}
	}
}
