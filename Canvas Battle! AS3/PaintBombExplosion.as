package 
{	
	import flash.events.Event;
	
	public class PaintBombExplosion extends Explosion
	{
		private var hitList:ArrayList;
		
		public function PaintBombExplosion(entity:PaintBomb,c:Boolean = false) 
		{
			super(entity,c);
			hitList = new ArrayList();
			AudioManager.playAudio(AudioManager.getSplatterSoundTwo());
		}
		public override function getClone():Entity
		{
			return new PaintBombExplosion(null,true);
		}
		public override function updateTimedVariables(evt:Event):void
		{
			super.updateTimedVariables(evt);
			if(!GameManager.gameIsPaused())
			{
				for(var i = 0;i<GameManager.getEnemyList().listSize();i++)
				{
					var enemy:Enemy = (GameManager.getEnemyList().getObject(i) as Enemy);
					if(!hitList.containsObject(enemy) && !enemy.isInvulnerable() && !(enemy is Paintapede) && !(enemy is Minipede))
					{
						hitList.addObject(enemy);
						enemy.takeDamage(20);
						i = 0;
					}
				}
				for(var i2 = 0;i2<GameManager.getMiscList().listSize();i2++)
				{
					var misc:Entity = (GameManager.getMiscList().getObject(i2) as Entity);
					if(!hitList.containsObject(misc) && ((misc is PinkMissile) || misc is EggMissile || (misc is WaterBubble && !(misc as WaterBubble).isInvulnerable()) || misc is ChaoticBomb || misc is BrownMissile || misc is GreenMissile || misc is LightBlueMissile))
					{
						hitList.addObject(misc);
						if(misc is PinkMissile)
							(misc as PinkMissile).explode();
						else if(misc is EggMissile)
							(misc as EggMissile).explode();
						else if(misc is WaterBubble)
							(misc as WaterBubble).explode();
						else if(misc is ChaoticBomb)
							(misc as ChaoticBomb).explode();
						else if(misc is BrownMissile)
							(misc as BrownMissile).explode();
						else if(misc is GreenMissile)
							(misc as GreenMissile).explode();
						else if(misc is LightBlueMissile)
							(misc as LightBlueMissile).explode();
						i2 = 0;
					}
				}
			}
		}
	}
}