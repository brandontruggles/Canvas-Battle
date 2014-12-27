package 
{
	public class PlayerExplosion extends Explosion
	{
		public function PlayerExplosion(ball:PlayerBall,c:Boolean = false)
		{
			super(ball,c);
			fillWithColor(ball.getColor());
		}
		public override function getClone():Entity
		{
			return new PlayerExplosion(null,true);
		}
		public override function removeFromStage():void
		{
			if(GameManager.getScore()>=GameManager.getExtraLifeScore() && GameManager.getGameMode() != 0)
			{
				GameManager.setPaused(true);
				
				for(var i = 0;i<GameManager.getMiscList().listSize();i++)
				{
					var m:Entity = (GameManager.getMiscList().getObject(i) as Entity);
					if(!(m is TutorialTextBanner))
						m.stopPlaying();
				}
				for(var i2 = 0;i2<GameManager.getPlayerList().listSize();i2++)
				{
					var p:PlayerBall = (GameManager.getPlayerList().getObject(i2) as PlayerBall);
					p.stopPlaying();
				}
				for(var i3 = 0;i3<GameManager.getEnemyList().listSize();i3++)
				{
					var e:Enemy = (GameManager.getEnemyList().getObject(i3) as Enemy);
					e.stopPlaying();
				}
				
				if(GameManager.getGameMode() == 1)
				{
					var s:SinglePlayerDeathMenu = new SinglePlayerDeathMenu();
					s.addToParent(GameManager.getTimeline());
				}
				else if(GameManager.getGameMode() == 2)
				{
					var m2:MultiPlayerDeathMenu = new MultiPlayerDeathMenu((sourceEntity as PlayerBall));
					m2.addToParent(GameManager.getTimeline());
				}
				super.removeFromStage();
				
				if(GameManager.getDifficulty() == 1)
					GameManager.setExtraLifeScore(Math.round(GameManager.getScore()/2)+500);
				else if(GameManager.getDifficulty() == 2)
					GameManager.setExtraLifeScore(Math.round(GameManager.getScore()/2)+1250);
				else if(GameManager.getDifficulty() == 3)
					GameManager.setExtraLifeScore(Math.round(GameManager.getScore()/2)+2500);
			}
			else
			{
				super.removeFromStage();
				if(GameManager.getPlayerList().listSize() == 0)
				{
					GameManager.endCurrentGame();
					AudioManager.playAudio(AudioManager.getGameOverSound());
				}
			}
		}
	}
}