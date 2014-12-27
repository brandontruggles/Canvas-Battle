package  
{	
	import flash.events.Event;
	
	public class ChaoticBombExplosion extends Explosion
	{
		public function ChaoticBombExplosion(entity:ChaoticBomb,c:Boolean = false)
		{
			super(entity,c);
			
			if(!clone)
			{
				hitRadius = 42;
				AudioManager.playAudio(AudioManager.getSplatterSoundTwo());
			}
		}
		public override function getClone():Entity
		{
			return new ChaoticBombExplosion(null,true);
		}
		public override function updateTimedVariables(evt:Event):void
		{
			super.updateTimedVariables(evt);
			if(!GameManager.gameIsPaused())
			{
				if(currentFrame!=totalFrames)
				{
					for(var i = 0;i<GameManager.getPlayerList().listSize();i++)
					{
						var player:Entity = (GameManager.getPlayerList().getObject(i) as Entity);
						if(hitTestObject((player as PlayerBall).getShield()) && (player as PlayerBall).getShield().visible && !(player as PlayerBall).isInvulnerable())
						{
							(player as PlayerBall).getShield().takeDamage(20);
						}
						if(hitTestObject(player) && !(player as PlayerBall).isInvulnerable())
						{
							if(!(player as PlayerBall).isShielding())
								(player as PlayerBall).takeDamage(20);
						}
					}
				}
			}
		}
	}
}