package 
{
	import flash.events.Event;
	
	public class ShieldHealthBar extends MiniHealthBar
	{
		private var shield:PlayerShield;
		public function ShieldHealthBar(p:PlayerShield,c:Boolean = false) 
		{
			super(p,p.getHealth()/50);
			shield = p;
			x = shield.x-25;
			y = shield.y-40;
		}
		public override function getClone():Entity
		{
			return new ShieldHealthBar(shield,true);
		}
		public override function updateTimedVariables(evt:Event):void
		{
			super.updateTimedVariables(evt);
			
			if(!GameManager.gameIsPaused())
			{
				x = shield.x-25;
				y = shield.y-40;
			}
		}
		public override function removeFromStage():void
		{
			shield = null;
			super.removeFromStage();
		}
	}
}
