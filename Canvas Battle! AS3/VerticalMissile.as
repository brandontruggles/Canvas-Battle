package 
{
	import flash.events.Event;
	
	public class VerticalMissile extends Missile
	{
		protected var direct:Number
		
		public function VerticalMissile(entity:Entity,dir:Number,vel:Number,dmg:Number,c:Boolean = false)
		{
			super(entity,dmg,c);
			
			if(!clone)
			{
				if(dir == 0)
				{
					y = entity.y-15;
					rotation = 180;
				}
				else
					y = entity.y+15;
				direct = dir;
				if(!GameManager.timeIsSlowed())
					yVelocity = vel;
				else
					yVelocity = vel/2;
			}
		}
		public override function getClone():Entity
		{
			return new VerticalMissile(sourceEntity,direct,yVelocity,damage,true);
		}
		public override function travel():void
		{
			if(direct == 0)
				moveUp();
			else
				moveDown();
				
			checkCollision();
			
			if(y>400 || y<-100)
				removeFromStage();
		}
	}
}