package
{	
	import flash.events.Event;

	public class MultiDirectionalMissile extends Missile
	{
		private var xDir:Number;
		private var yDir:Number;
		
		public function MultiDirectionalMissile(entity:Entity,xVel:Number,yVel:Number,dmg:Number,c:Boolean = false)
		{
			super(entity,dmg,c);
			
			if(!clone)
			{
				if(xVel<0)
				{
					xDir = 0;
					xVelocity = xVel*-1;
				}
				else
				{
					xDir = 1;
					xVelocity  = xVel;
				}
				if(yVel<0)
				{
					yDir = 0;
					yVelocity = yVel*-1;
				}
				else
				{
					yDir = 1;
					yVelocity = yVel;
				}
			}
		}
		public override function getClone():Entity
		{
			return new MultiDirectionalMissile(sourceEntity,xVelocity,yVelocity,damage,true);
		}
		public override function travel():void
		{
			if(xDir == 0)
				moveLeft();
			else if(xDir == 1)
				moveRight();
			
			if(yDir == 0)
				moveUp();
			else if(yDir == 1)
				moveDown();
			
			checkCollision();
			
			if(x>=700 || x<=-100 || y>=400 || y<=-100)
				removeFromStage();
		}
	}
}