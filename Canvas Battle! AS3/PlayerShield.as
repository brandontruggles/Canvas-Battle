package  
{	
	import flash.events.Event;
	import flash.geom.ColorTransform;

	public class PlayerShield extends LivingEntity
	{
		private var player:PlayerBall;
		private var healthBar:ShieldHealthBar;
		
		public function PlayerShield(p:PlayerBall,c:Boolean = false) 
		{
			super(p.x,p.y,60,c);
			player = p;
			healthBar = new ShieldHealthBar(this);
			healthBar.setColor(player.getColor());
			fillWithColor(player.getColor());
			visible = false;
			hitRadius = 34.5;
			stop();
			
			if(!clone)
				GameManager.getMiscList().addObject(this);
		}
		public override function getClone():Entity
		{
			return new PlayerShield(player,true);
		}
		public function getPlayer():PlayerBall
		{
			return player;
		}
		public override function updateTimedVariables(evt:Event):void
		{
			super.updateTimedVariables(evt);
			
			if(!GameManager.gameIsPaused())
			{
				x = player.x;
				y = player.y;
				
				if(currentFrame == totalFrames)
				{
					visible = false;
					stop();
				}
			}
		}
		public override function takeDamage(amount:Number,src:Entity = null):void
		{
			player.takeDamage(0);
			super.takeDamage(amount,src);
		}
		public override function updateHealth(amount:Number):void
		{
			if(visible)
				healthBar.updateVisibility();
			if(health+amount<=20 && !healthBar.isFlashing())
				healthBar.startFlashing();
			super.updateHealth(amount);
		}
		public override function fillWithColor(c:ColorTransform):void
		{
			super.fillWithColor(c);
			healthBar.setColor(c);
		}
		public override function die():void
		{
			visible = false;
			healthBar.visible = false;
			player.setShielding(false);
			explode();
		}
		public override function addToParent(p:Object):void
		{
			super.addToParent(p);
			healthBar.addToParent(p);
			p.setChildIndex(this,CanvasManager.getCanvasIndex()+2);
		}
		public function extend():void
		{
			visible = true;
			gotoAndPlay(1);
		}
		public function contract():void
		{
			gotoAndPlay(6);
			healthBar.visible = false;
		}
		public function explode():void
		{
			var s:ShieldExplosion = new ShieldExplosion(this);
			s.addToParent(GameManager.getTimeline());
		}
		public override function removeFromStage():void
		{
			GameManager.getMiscList().removeObject(this);
			player = null;
			healthBar = null;
			super.removeFromStage();
		}
	}
	
}
