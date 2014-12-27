package 
{
	import flash.events.Event;
	
	public class HomingMissile extends Missile
	{
		private var targetEntity:Entity;
		private var duration:Number;
		
		public function HomingMissile(entity:Entity,vel:Number,dmg:Number,dur:Number,c:Boolean = false)
		{
			super(entity,dmg,c);
			if(!clone)
			{
				if(!GameManager.timeIsSlowed())
				{
					xVelocity = vel;
					yVelocity = vel;
				}
				else
				{
					xVelocity = vel/2;
					yVelocity = vel/2;
				}
				
				duration = dur;
				var playerSelector:Number = Math.round(Math.random()*(GameManager.getPlayerList().listSize()-1));
				targetEntity = (GameManager.getPlayerList().getObject(playerSelector) as Entity);
			}
		}
		public override function getClone():Entity
		{
			return new HomingMissile(sourceEntity,xVelocity,damage,duration,true);
		}
		public override function updateTimedVariables(evt:Event):void
		{
			super.updateTimedVariables(evt);
			
			if(!GameManager.gameIsPaused())
			{
				if(duration>0)
				duration--;
				else
				explode();
			}
		}
		public override function travel():void
		{
			if(targetEntity!=null)
			{
				if(x>targetEntity.x)
					moveLeft();
				if(x<targetEntity.x)
					moveRight();
				if(y>targetEntity.y)
					moveUp();
				if(y<targetEntity.y)
					moveDown();
			}
			else
			{
				selectNewTarget();
			}
			checkCollision();
		}
		public function selectNewTarget():void
		{
			var playerSelector:Number = Math.round(Math.random()*(GameManager.getPlayerList().listSize()-1));
			targetEntity = (GameManager.getPlayerList().getObject(playerSelector) as Entity);
		}
		public function explode():void
		{
			removeFromStage();
		}
		public override function removeFromStage():void
		{
			targetEntity = null;
			super.removeFromStage();
		}
	}
}