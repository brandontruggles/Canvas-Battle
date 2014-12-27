package  
{
	import flash.events.Event;
	
	public class PurpleEgg extends EnemyEgg
	{
		var amount:Number;
		
		public function PurpleEgg(xpos:Number,ypos:Number,c:Boolean = false)
		{
			super(xpos,ypos,c);
			
			if(!clone)
			{
				amount = Math.random()*2+1;
				hitRadius = 10;
			}
		}
		public override function getClone():Entity
		{
			return new PurpleEgg(x,y,true);
		}
		public override function hatch():void
		{
			var startingY:Number = y-20;
			
			for(var i = 0;i<amount;i++)
			{
				var ball:PurpleBall = new PurpleBall();
				ball.x = x;
				ball.y = startingY;
				ball.addToParent(parent);
				startingY+=30;
			}
			super.hatch();
		}
		public override function explode():void
		{
			var explosion:PurpleEggExplosion = new PurpleEggExplosion(this);
			explosion.addToParent(GameManager.getTimeline());
			super.explode();
		}
	}
}