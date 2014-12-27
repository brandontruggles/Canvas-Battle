package  
{	
	import flash.events.Event;

	public class WaterBubble extends MultiDirectionalMissile
	{
		private var parentWaterBoss:WaterBoss;
		private var floatSpeed:Number;
		private var horizontalFloatTimer:Number;
		private var verticalFloatTimer:Number;
		private var floatingUp:Boolean;
		private var floatingLeft:Boolean;
		
		public function WaterBubble(entity:WaterBoss,xpos:Number,ypos:Number,xVel:Number,yVel:Number,c:Boolean = false)
		{
			super(entity,xVel,yVel,0,c);
			
			x = xpos;
			y = ypos;
			damage = 20;
			hitRadius = 18;
			parentWaterBoss = entity;
			
			if(!GameManager.timeIsSlowed())
				floatSpeed = 6;
			else
				floatSpeed = 3;
			
			horizontalFloatTimer = 0;
			verticalFloatTimer = 0;
			
			floatingUp = true;
			floatingLeft = true;
		}
		public override function getClone():Entity
		{
			return new WaterBubble(parentWaterBoss,x,y,xVelocity,yVelocity,true);
		}
		public function isInvulnerable():Boolean
		{
			return parentWaterBoss.isPlayingIntro();
		}
		public override function updateTimedVariables(evt:Event):void
		{
			super.updateTimedVariables(evt);
			
			if(!GameManager.gameIsPaused())
			{
				if(yVelocity!=0)
				{
					if(floatingLeft)
					{
						if(horizontalFloatTimer<2)
						{
							x-=floatSpeed;
							horizontalFloatTimer++;
						}
						else
						{
							floatingLeft = false;
							horizontalFloatTimer = 0;
						}
					}
					else if(!floatingLeft)
					{
						if(horizontalFloatTimer<2)
						{
							x+=floatSpeed;
							horizontalFloatTimer++;
						}
						else
						{
							floatingLeft = true;
							horizontalFloatTimer = 0;
						}
					}
				}
				if(xVelocity!=0)
				{
					if(floatingUp)
					{
						if(verticalFloatTimer<2)
						{
							y-=floatSpeed;
							verticalFloatTimer++;
						}
						else
						{
							floatingUp = false;
							verticalFloatTimer = 0;
						}
					}
					else if(!floatingUp)
					{
						if(verticalFloatTimer<2)
						{
							y+=floatSpeed;
							verticalFloatTimer++;
						}
						else
						{
							floatingUp = true;
							verticalFloatTimer = 0;
						}
					}
				}
			}
		}
		public override function checkCollision():void
		{
			if(parentWaterBoss.isPlayingIntro() && x>=parentWaterBoss.x && x<=parentWaterBoss.x+20)
			{
				removeFromStage();
			}
			else
			{
				for(var i = 0;i<GameManager.getPlayerList().listSize();i++)
				{
					var player:Entity = (GameManager.getPlayerList().getObject(i) as Entity);
					if(hitTestObject((player as PlayerBall).getShield()) && (player as PlayerBall).getShield().visible && !(player as PlayerBall).isInvulnerable())
					{
						if(!isInvulnerable())
							explode();
						(player as PlayerBall).getShield().takeDamage(damage);
					}
					if(hitTestObject(player) && !(player as PlayerBall).isInvulnerable())
					{
						if(!isInvulnerable())
							explode();
						if(!(player as PlayerBall).isShielding())
							(player as PlayerBall).takeDamage(damage);
					}
				}
			}
		}
		public function explode():void
		{
			AudioManager.playAudio(AudioManager.getBubblePopSound());
			var explosion:BubbleExplosion =  new BubbleExplosion(this);
			explosion.addToParent(GameManager.getTimeline());
			AudioManager.playAudio(AudioManager.getBubblePopSound());
			removeFromStage();
		}
		public override function removeFromStage():void
		{
			parentWaterBoss = null;
			super.removeFromStage();
		}
	}
}