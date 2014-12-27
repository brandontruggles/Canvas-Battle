package  
{
	import flash.events.Event;
	
	public class MiniBoss extends Enemy
	{
		protected var healthBar:MiniHealthBar;
		protected var originalHealth:Number;
		
		public function MiniBoss(xpos:Number,ypos:Number,h:Number,xVel:Number,yVel:Number,c:Boolean = false) 
		{
			super(xpos,ypos,h,xVel,yVel,c);
			
			if(!clone)
			{
				originalHealth = health;
				healthBar = new MiniHealthBar(this,health/50);
			}
		}
		public override function getClone():Entity
		{
			return new MiniBoss(x,y,health,xVelocity,yVelocity,true);
		}
		public override function updateHealth(amount:Number):void
		{
			healthBar.updateVisibility();
			
			if(health+amount<=originalHealth*.4 && !healthBar.isFlashing())
				healthBar.startFlashing();
				
			super.updateHealth(amount);
		}
		public override function addToParent(p:Object):void
		{
			super.addToParent(p);
			
			if(!clone)
			{
				healthBar.addToParent(p);
				
				if(!SpawnManager.bossIsSpawned())
					SpawnManager.setBossSpawned(true);
			}
		}
		public override function removeFromStage():void
		{
			if(!clone)
			{
				var bossCount:Number = 0;
				for(var i = 0;i<GameManager.getEnemyList().listSize();i++)
					if(GameManager.getEnemyList().getObject(i)!=this && (GameManager.getEnemyList().getObject(i) is MiniBoss || GameManager.getEnemyList().getObject(i) is Boss))
						bossCount++;
				
				if(bossCount == 0)
					if(SpawnManager.bossIsSpawned())
					{
						SpawnManager.setBossSpawned(false);
						SpawnManager.changeSpawnRandTo(40);
					}
	
				healthBar.removeFromStage();
			}
			
			healthBar = null;
			super.removeFromStage();
		}
	}
	
}