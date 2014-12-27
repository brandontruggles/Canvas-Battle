package  
{
	import flash.events.Event;

	public class PaintapedeHead extends Enemy
	{
		protected var host:Minipede;
		protected var originX:Number;
		protected var originY:Number;
		protected var hitTop:Boolean;
		protected var hitRight:Boolean;
		
		public function PaintapedeHead(xpos:Number,ypos:Number,h:Number,minipede:Minipede,c:Boolean = false)
		{
			super(xpos,ypos,h,minipede.getXVelocity(),minipede.getYVelocity(),c)
			host = minipede;
			
			if(!clone)
			{
				host.getPartsList().addObject(this);
				host.updateHealth(h);
				damage = host.getDamage();
				originX = x;
				originY = y;
				hitTop = false;
				hitRight = false;
				pointValue = 250;
			}
		}
		public override function getClone():Entity
		{
			return new PaintapedeHead(x,y,health,host,true);
		}
		public function setHost(newHost:Minipede):void
		{
			host = newHost;
			host.updateHealth(health);
			host.getPartsList().addObject(this);
		}
		public function setOrigin(oX:Number,oY:Number):void
		{
			originX = oX;
			originY = oY;
			hitTop = false;
			hitRight = false;
		}
		public override function takeDamage(amount:Number,src:Entity = null):void
		{
			host.takeDamage(amount,src);
			super.takeDamage(amount,src);
		}
		public override function updateTimedVariables(evt:Event):void
		{
			super.updateTimedVariables(evt);
			if(!GameManager.gameIsPaused())
				sway(host.getDirection());
		}
		public function sway(dir:Number):void
		{
			if(dir == 0 || dir == 1)
			{
				if(!hitTop)
				{
					if(y>originY-host.getHeight()/2+height/4)
						y-=2;
					else
						hitTop = true;
				}
				else
				{
					if(y<originY+host.getHeight()/2-height/4)
						y+=2;
					else
						hitTop = false;
				}
			}
			else if(dir == 2 || dir == 3)
			{
				if(!hitRight)
				{
					if(x<originX+host.getHeight()/2-height/4)
						x+=2;
					else
						hitRight = true;
				}
				else
				{
					if(x>originX-host.getHeight()/2+height/4)
						x-=2;
					else
						hitRight = false;
				}
			}
		}
		public function explode():void
		{
			AudioManager.playAudio(AudioManager.getSplatterSoundTwo());
			
			var powerUpRand:Number = Math.round(Math.random()*4);
			if(powerUpRand == 0)
			{
				var h:HealthPowerUp = new HealthPowerUp(x,y);
				h.addToParent(GameManager.getTimeline());
			}
			else if(powerUpRand == 1)
			{
				var r:RapidFirePowerUp = new RapidFirePowerUp(x,y);
				r.addToParent(GameManager.getTimeline());
			}
			else if(powerUpRand == 2)
			{
				var s:SplitShotPowerUp = new SplitShotPowerUp(x,y);
				s.addToParent(GameManager.getTimeline());
			}
			else if(powerUpRand == 3)
			{
				var ps:PlayerSlowPowerUp = new PlayerSlowPowerUp(x,y);
				ps.addToParent(GameManager.getTimeline());
			}
			else if(powerUpRand == 4)
			{
				var shieldup:ShieldPowerUp = new ShieldPowerUp(x,y);
				shieldup.addToParent(GameManager.getTimeline());
			}
		}
		public override function die():void
		{
			explode();
			
			if(host.getPartsList()!=null)
			{
				if(host.getPartsList().getObject(0) != this && host.getPartsList().getObject(host.getPartsList().listSize()-1) != this)
				{
					host.breakApart(this);
				}
				else
					host.getPartsList().removeObject(this);
			}
			super.die();
		}
		public override function removeFromStage():void
		{
			super.removeFromStage();
			host = null;
		}
	}
}