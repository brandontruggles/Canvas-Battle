package 
{
	import flash.events.Event;
	
	public class Enemy extends LivingEntity
	{
		protected var pointValue:Number;
		protected var imageTimer:Number;
		protected var lastDamageSource:Entity;
		
		public function Enemy(xpos:Number,ypos:Number,h:Number,xVel:Number,yVel:Number,c:Boolean = false) 
		{
			super(xpos,ypos,h,c);
			
			if(!clone)
			{
				if(!GameManager.timeIsSlowed())
				{
					xVelocity = xVel;
					yVelocity = yVel;
				}
				else if(!(this is Boss) && !(this is Minipede) && !(this is PaintapedeHead))
				{
					xVelocity = xVel/2;
					yVelocity = yVel/2;
				}
				else
				{
					xVelocity = xVel;
					yVelocity = yVel;
				}
				pointValue = 0;
				imageTimer = 0;
				GameManager.getEnemyList().addObject(this);
			}
			else if(clone && GameManager.getGameMode() == 0)
				GameManager.getEnemyList().addObject(this);
		}
		public override function getClone():Entity
		{
			return new Enemy(x,y,health,xVelocity,yVelocity,true);
		}
		public override function updateTimedVariables(evt:Event):void
		{
			if(!GameManager.gameIsPaused())
			{
				travel();
				
				if(GameManager.timeIsSlowed() && !(this is Boss) && !(this is PaintapedeHead) && !(this is Minipede))
				{
					if(imageTimer<5)
					imageTimer++;
					else
					{
						attachFade();
						imageTimer = 0;
					}
				}
			}
		}
		public override function addToParent(p:Object):void
		{
			super.addToParent(p);
			p.setChildIndex(this,CanvasManager.getCanvasIndex()+2);
		}
		public override function die():void
		{
			if(lastDamageSource!=null && (lastDamageSource is PlayerMissile) && (lastDamageSource as PlayerMissile).getSourceEntity()!=null)
			{
				var comboBefore = ((lastDamageSource as PlayerMissile).getSourceEntity() as PlayerBall).getCombo();
				GameManager.setScore(GameManager.getScore()+pointValue*((lastDamageSource as PlayerMissile).getSourceEntity() as PlayerBall).getCombo());
				((lastDamageSource as PlayerMissile).getSourceEntity() as PlayerBall).increaseCombo();
				
				if(comboBefore!=((lastDamageSource as PlayerMissile).getSourceEntity() as PlayerBall).getCombo())
				{
					var c:ComboFade = new ComboFade(x,y,((lastDamageSource as PlayerMissile).getSourceEntity() as PlayerBall));
					c.addToParent(GameManager.getTimeline());
				}
			}
			else if(this is Target)
			{
				GameManager.setScore(GameManager.getScore()+pointValue*((GameManager.getPlayerList().getObject(0) as PlayerBall)).getCombo());
				(GameManager.getPlayerList().getObject(0) as PlayerBall).increaseCombo();
			}
			else
				GameManager.setScore(GameManager.getScore()+pointValue);
			super.die();
		}
		public override function takeDamage(amount:Number,src:Entity = null):void
		{
			lastDamageSource = src;
			super.takeDamage(amount,src);
		}
		public override function removeFromStage():void
		{
			GameManager.getEnemyList().removeObject(this);
			super.removeFromStage();
			lastDamageSource = null;
		}
	}
}