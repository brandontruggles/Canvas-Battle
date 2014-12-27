package  
{	
	public class ChaoticBossExplosion extends Explosion
	{
		public function ChaoticBossExplosion(entity:ChaoticBoss,c:Boolean = false)
		{
			super(entity,c);
		}
		public override function getClone():Entity
		{
			return new ChaoticBossExplosion(null,true);
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
				
			AudioManager.loopAudio(AudioManager.getChaosMusic());
			
			var portal:Portal = new Portal(50,Math.random()*220+50,Portal.TYPE_EXIT());
			portal.addToParent(GameManager.getTimeline());
				
			super.removeFromStage();
		}
	}
}