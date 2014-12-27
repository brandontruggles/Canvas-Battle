package
{	
	import flash.events.Event;

	public class Target extends Enemy
	{
		public function Target(xpos:Number,ypos:Number,c:Boolean = false)
		{
			super(xpos,ypos,20,0,0,c);
			
			if(!clone)
			{
				alpha = 0;
				hitRadius = 16.5;
				pointValue = 100;
				stoppingList.addObject(currentFrame);
				stoppingList.addObject(totalFrames);
				invulnerable = true;
				stop();
			}
		}
		public override function getClone():Entity
		{
			return new Target(x,y,true);
		}
		public override function updateTimedVariables(evt:Event):void
		{
			super.updateTimedVariables(evt);
			
			if(!GameManager.gameIsPaused())
			{
				if(currentFrame == 1)
				{
					if(alpha<1)
						alpha+=.04;
					else
					{
						alpha = 1;
						invulnerable = false;
					}
				}
				else if(currentFrame == totalFrames)
				{
					if(alpha>0)
						alpha-=.04;
					else
					{
						if(GameManager.getGameMode() == 0)
						{
							var targetPresent:Boolean = false;
							
							for(var i = 0;i<GameManager.getEnemyList().listSize();i++)
								if(GameManager.getEnemyList().getObject(i) is Target && GameManager.getEnemyList().getObject(i)!=this)
									targetPresent = true;
							
							if(!targetPresent)
								TutorialManager.changeMessages();
						}
						super.die();
					}
				}
			}
		}
		public override function takeDamage(amount:Number,src:Entity = null):void
		{
			super.takeDamage(amount,src);
			invulnerable = true;
		}
		public override function die():void
		{
			gotoAndPlay(2);
		}
	}
}