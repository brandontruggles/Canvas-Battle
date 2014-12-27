package 
{	
	import flash.events.Event;

	public class WaterBossExplosion extends Explosion
	{
		private var spawnedPowerUp:Boolean;
		public function WaterBossExplosion(entity:WaterBoss,c:Boolean = false)
		{
			super(entity,c);
			spawnedPowerUp = false;
		}
		public override function getClone():Entity
		{
			return new WaterBossExplosion(null,true);
		}
		public override function updateTimedVariables(evt:Event):void
		{
			super.updateTimedVariables(evt);
			
			if(!GameManager.gameIsPaused())
			{
				if(currentFrame == 35 && !spawnedPowerUp)
				{
					var shieldup:ShieldPowerUp = new ShieldPowerUp(x,y);
					shieldup.addToParent(GameManager.getTimeline());
					spawnedPowerUp = true;
				}
			}
		}
		public override function removeFromStage():void
		{
			var bossCount:Number = 0;
			for(var i = 0;i<GameManager.getEnemyList().listSize();i++)
			{
				var e:Enemy = (GameManager.getEnemyList().getObject(i) as Enemy);
				if(e is MiniBoss || e is Boss)
					bossCount++;
			}
			
			if(bossCount == 0)
				if(SpawnManager.bossIsSpawned())
				{
					SpawnManager.setBossSpawned(false);
					SpawnManager.changeSpawnRandTo(40);
				}
				
			GameManager.playBackgroundMusic();
				
			super.removeFromStage();
		}
	}
}