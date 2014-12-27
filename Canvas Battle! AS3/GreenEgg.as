package  
{
	import flash.events.Event;
	
	public class GreenEgg extends EnemyEgg
	{
		var amount:Number;
		
		public function GreenEgg(xpos:Number,ypos:Number)
		{
			super(xpos,ypos);
			
			if(!clone)
			{
				amount = Math.random()*2+1;
				hitRadius = 10;
			}
		}
		public override function hatch():void
		{
			var startingY:Number = y-20;
			
			for(var i = 0;i<amount;i++)
			{
				var ball:GreenBall = new GreenBall();
				ball.x = x;
				ball.y = startingY;
				ball.addToParent(parent);
				startingY+=30;
			}
			super.hatch();
		}
		public override function explode():void
		{
			var explosion:GreenEggExplosion = new GreenEggExplosion(this);
			explosion.addToParent(GameManager.getTimeline());
			super.explode();
		}
	}
}