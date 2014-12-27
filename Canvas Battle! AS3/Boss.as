package 
{
	import flash.events.Event;

	public class Boss extends Enemy
	{
		protected var healthBar:BossHealthBar;
		protected var playingIntro:Boolean;
		protected var originalHealth:Number;
		protected var cautionAlert:BossCautionAlert;
		
		public function Boss(xpos:Number,ypos:Number,h:Number,xVel:Number,yVel:Number,c:Boolean = false)
		{
			super(xpos,ypos,h,xVel,yVel,c);
			if(!clone)
			{
				healthBar = new BossHealthBar(132,292,this,h/400);
				originalHealth = health;
				cautionAlert = new BossCautionAlert(500,150);
				cautionAlert.addToParent(GameManager.getTimeline());
				playingIntro = true;
			}
		}
		public function isPlayingIntro():Boolean
		{
			return playingIntro;
		}
		public override function getClone():Entity
		{
			return new Boss(x,y,health,xVelocity,yVelocity,true);
		}
		public override function takeDamage(amount:Number,src:Entity = null):void
		{
			if(!playingIntro)
				super.takeDamage(amount,src);
		}
		public override function updateHealth(amount:Number):void
		{
			healthBar.updateSize(amount);
			if(health<=originalHealth*.4 && !healthBar.isFlashing())
				healthBar.startFlashing();
			super.updateHealth(amount);
		}
		public override function addToParent(p:Object):void
		{
			super.addToParent(p);
			healthBar.addToParent(p);
			if(!SpawnManager.bossIsSpawned())
				SpawnManager.setBossSpawned(true);
		}
		public override function removeFromStage():void
		{
			healthBar.removeFromStage();
			healthBar = null;
			super.removeFromStage();
		}
	}
}