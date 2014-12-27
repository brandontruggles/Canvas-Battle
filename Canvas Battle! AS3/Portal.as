package 
{	
	import flash.events.Event;
	import flash.geom.ColorTransform;
	
	public class Portal extends Entity
	{
		private var opened:Boolean;
		private var expanding:Boolean;
		private var retracting:Boolean;
		private var swallowing:Boolean;
		private var swallowCount:Number;
		private var durationCounter:Number;
		private var type:Number;
		
		public function Portal(xpos:Number,ypos:Number,t:Number,c:Boolean = false)
		{
			super(Math.random()*500+50,Math.random()*220+50,0,0,null,c);
			
			if(!clone)
			{
				x = xpos;
				y = ypos;
				type = t;
				opened = false;
				expanding = true;
				retracting = false;
				swallowing = false;
				swallowCount = 0;
				durationCounter = 0;
				hitRadius = 30;
				GameManager.getMiscList().addObject(this);
			}
		}
		public static function TYPE_ENTRANCE():Number
		{
			return 0;
		}
		public static function TYPE_EXIT():Number
		{
			return 1;
		}
		public override function getClone():Entity
		{
			return new Portal(x,y,type,true);
		}
		public override function updateTimedVariables(evt:Event):void
		{
			if(!GameManager.gameIsPaused())
			{
				if(expanding)
				{
										
					if(!opened && width<60)
						expand();
						
					else if(!opened && width>=60)
					{
						opened = true;
						expanding = false;
						if(type == TYPE_ENTRANCE())
						{
							for(var i = 0;i<GameManager.getPlayerList().listSize();i++)
							{
								var p:PlayerBall = (GameManager.getPlayerList().getObject(i) as PlayerBall);
								p.setInvulnerabilityDuration(60);
								p.setXVelocity(10);
								p.setYVelocity(10);
								p.x = x-width/2+Math.random()*width;
								p.y = y-height/2+Math.random()*height;
								p.setShootLimit(15);
								p.setInvulnerable(false);
								p.visible = true;
							}
						}
					}
						
				}
				else if(retracting)
				{
					if(width>30)
						retract();
					else if(width<=30)
					{
						removeFromStage();
						if(type == TYPE_EXIT() && swallowCount>0)
							GameManager.switchDimensions();
					}
				}
				if(swallowing)
				{
					for(var i2 = 0;i2<GameManager.getPlayerList().listSize();i2++)
					{
						var p2:PlayerBall = (GameManager.getPlayerList().getObject(i2) as PlayerBall);
						if(p2.visible)
						{
							if(p2.x<x-6)
								p2.moveRightByAmount(6);
							else if(p2.x>x+6)
								p2.moveLeftByAmount(6);
							
							if(p2.y<y-6)
								p2.moveDownByAmount(6);
							else if(p2.y>y+6)
								p2.moveUpByAmount(6);
							
							if(p2.x>=x-6 && p2.x<=x+6 && p2.y>=y-6 && p2.y<=y+6)
							{
								if(p2.isFlashing())
									p2.setFlashing(false);
								p2.visible = false;
								swallowCount++;
								if(swallowCount == GameManager.getPlayerList().listSize())
								{
									swallowing = false;
									opened = false;
									retracting = true;
								}
							}
						}
					}
				}
				
				if(opened && type == TYPE_EXIT())
				{
					checkCollision();
					if(durationCounter<240)
					{
						if(swallowCount == 0)
							durationCounter++;
					}
					else
					{
						opened = false;
						retracting = true;
					}
				}
				else if(opened && type == TYPE_ENTRANCE())
					retracting = true;
			}
		}
		public override function addToParent(p:Object):void
		{
			super.addToParent(p);
			p.setChildIndex(this,CanvasManager.getCanvasIndex()+2);
		}
		public override function removeFromStage():void
		{
			super.removeFromStage();
			GameManager.getMiscList().removeObject(this);
		}
		public override function checkCollision():void
		{
			for(var i = 0;i<GameManager.getPlayerList().listSize();i++)
				if(GameManager.getPlayerList().getObject(i).hittingEntity(this))
					swallowPlayers();
		}
		public function expand():void
		{
			width+=1;
			height+=1;
		}
		public function retract():void
		{
			width-=1;
			height-=1;
		}
		public function swallowPlayers():void
		{
			for(var i = 0;i<GameManager.getPlayerList().listSize();i++)
			{
				var p:PlayerBall = (GameManager.getPlayerList().getObject(i) as PlayerBall);
				p.setXVelocity(0);
				p.setYVelocity(0);
				p.setInvulnerabilityDuration(100000);
				p.setShootLimit(100000);
				p.setInvulnerable(true);
			}
			swallowing = true;
		}
	}
}