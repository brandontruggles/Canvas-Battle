package 
{
	import flash.events.Event;
	
	public class BasicMissile extends Missile
	{
		protected var direct:Number
		
		public function BasicMissile(entity:Entity,dir:Number,vel:Number,dmg:Number,c:Boolean = false)
		{
			super(entity,dmg,c);

			if(!clone)
			{
				if(dir == 0)
				{
					x = entity.x-15;
					rotation = 180;
				}
				else
					x = entity.x+15;
					
				direct = dir;
				
				if(!GameManager.timeIsSlowed())
					xVelocity = vel;
				else
					xVelocity = vel/2;
			}
		}
		public override function getClone():Entity
		{
			return new BasicMissile(sourceEntity,direct,xVelocity,damage,true);
		}
		public override function travel():void
		{
			if(direct == 0)
				moveLeft();
			else
				moveRight();
				
			checkCollision();
			
			if(x>700 || x<-100)
				removeFromStage();
		}
	}
}