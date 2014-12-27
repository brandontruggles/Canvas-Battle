package 
{	
	import flash.events.Event;
	
	public class YellowBall extends MiniBoss
	{
		private var parentBrownBall:BrownBall;
		private var hitRight:Boolean;
		private var hitTop:Boolean;
		
		public function YellowBall(xpos:Number,ypos:Number,bBall:BrownBall,c:Boolean = false) 
		{
			super(xpos,ypos,60,4,4,c);
			
			if(!clone)
			{
				damage = 20;
				hitRadius = 8;
				pointValue = 50;
				parentBrownBall = bBall;
				if(x<=parentBrownBall.x)
				{
					if(y<=parentBrownBall.y)
						hitRight = false;
					else
						hitRight = true;
					hitTop = false;
				}
				else
				{	
					hitTop = true;
					if(y<=parentBrownBall.y)
						hitRight = false;
					else
						hitRight = true;
				}
			}
		}
		public override function getClone():Entity
		{
			return new YellowBall(x,y,parentBrownBall,true);
		}
		public override function updateTimedVariables(evt:Event):void
		{
			super.updateTimedVariables(evt);
			
			if(!GameManager.gameIsPaused())
			{
				if(hitRight)
				{
					if(x>parentBrownBall.x-50)
						moveLeft();
					else
						hitRight = false;
				}
				else
				{
					if(x<parentBrownBall.x+50)
						moveRight();
					else
						hitRight = true;
				}
				
				if(hitTop)
				{
					if(y<parentBrownBall.y+50)
						moveDown();
					else
						hitTop = false;
				}
				else
				{
					if(y>parentBrownBall.y-50)
						moveUp();
					else
						hitTop = true;
				}
			}
		}
		public override function removeFromStage():void
		{
			parentBrownBall.getYellowBallList().removeObject(this);
			parentBrownBall = null;
			super.removeFromStage();
		}
		public function explode():void
		{
			var explosion:YellowExplosion = new YellowExplosion(this);
			explosion.addToParent(GameManager.getTimeline());
			
			var powerUpRand:Number = Math.round(Math.random()*4);
			if(powerUpRand == 0)
			{
				var h:HealthPowerUp = new HealthPowerUp(x,y);
				h.addToParent(GameManager.getTimeline());
			}
		}
		public override function die():void
		{
			explode();
			super.die();
		}
	}
}