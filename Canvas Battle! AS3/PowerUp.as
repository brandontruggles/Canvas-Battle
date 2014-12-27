package 
{
	import flash.events.Event;
	
	public class PowerUp extends Entity
	{
		protected var floatingUpward:Boolean;
		protected var floatSpeed:Number;
		protected var floatDistance:Number;
		protected var floatTop:Number;
		protected var floatBottom:Number;
		protected var disappearTimer:Number;
		protected var disappears:Boolean;
		protected var disappearing:Boolean;
		protected var banner:PowerUpBanner;
		
		public function PowerUp(xpos:Number,ypos:Number,c:Boolean = false)
		{
			super(xpos,ypos,0,0,null,c);
			
			if(!clone)
			{
				GameManager.getMiscList().addObject(this);
				floatingUpward = false;
				disappears = true;
				disappearing = false;
				
				if(!GameManager.timeIsSlowed())
					floatSpeed = 2;
				else
					floatSpeed = 1;
				
				floatDistance = 20;
				floatTop = y-floatDistance;
				floatBottom = y+floatDistance;
				disappearTimer = 0;
			}
		}
		public function getFloatSpeed():Number
		{
			return floatSpeed;
		}
		public function setFloatSpeed(n:Number):void
		{
			floatSpeed = n;
		}
		public override function getClone():Entity
		{
			return new PowerUp(x,y,true);
		}
		public override function updateTimedVariables(evt:Event):void
		{
			super.updateTimedVariables(evt);
			if(!GameManager.gameIsPaused())
			{
				float();
				checkCollision();
				
				if(disappears && GameManager.getGameMode()!=0)
				{
					if(disappearTimer<240)
						disappearTimer++;
					else
						disappearing = true;
					
					if(disappearing)
					{
						if(alpha>0)
							alpha-=.02;
						else
							removeFromStage();
					}
				}
			}
		}
		public override function checkCollision():void
		{
			for(var i = 0;i<GameManager.getPlayerList().listSize();i++)
				if(hitTestObject((GameManager.getPlayerList().getObject(i) as Entity)))
					useEffectOn((GameManager.getPlayerList().getObject(i) as PlayerBall));
		}
		public function useEffectOn(p:PlayerBall):void
		{
			attachBannerToEntity(p);
			removeFromStage();
		}
		public function float():void
		{
			if(floatingUpward)
			{
				if(y>floatTop)
					y-=floatSpeed;
				else
					floatingUpward = false;
			}
			else if(!floatingUpward)
			{
				if(y<floatBottom)
					y+=floatSpeed;
				else
					floatingUpward = true;
			}
		}
		public function attachBannerToEntity(e:Entity):void
		{
			
		}
		public override function addToParent(p:Object):void
		{
			super.addToParent(p);
			p.setChildIndex(this,CanvasManager.getCanvasIndex()+2);
		}
		public override function removeFromStage():void
		{
			GameManager.getMiscList().removeObject(this);
			banner = null;
			super.removeFromStage();
		}
	}
}