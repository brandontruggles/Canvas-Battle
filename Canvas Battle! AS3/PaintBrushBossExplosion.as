package  
{
	import flash.display.MovieClip;
	import flash.events.Event;

	public class PaintBrushBossExplosion extends Explosion
	{
		private var spawnedShield:Boolean = false;
		
		public function PaintBrushBossExplosion(entity:PaintBrushBoss, c:Boolean = false) 
		{
			super(entity,c);
			x = entity.x+60;
			y = entity.y+6;
			AudioManager.playAudio(AudioManager.getPaintBrushExplosionSound());
		}
		public override function updateTimedVariables(evt:Event):void
		{
			super.updateTimedVariables(evt);
			if(!GameManager.gameIsPaused())
			{
				if(currentFrame == 80 && !spawnedShield)
				{
					var s:ShieldPowerUp = new ShieldPowerUp(x+80,y+40);
					s.addToParent(GameManager.getTimeline());
					spawnedShield = true;
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
