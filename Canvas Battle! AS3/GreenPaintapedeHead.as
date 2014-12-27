package 
{	
	public class GreenPaintapedeHead extends PaintapedeHead
	{
		public function GreenPaintapedeHead(xpos:Number,ypos:Number,m:Minipede,c:Boolean = false) 
		{
			super(xpos,ypos,160,m,c);
			if(!clone)
				hitRadius = 33.5;
		}
		public override function getClone():Entity
		{
			return new GreenPaintapedeHead(x,y,host,true);
		}
		public override function explode():void
		{
			super.explode();
			var explosion:FirstPaintapedeExplosion = new FirstPaintapedeExplosion(this);
			explosion.addToParent(GameManager.getTimeline());
		}
	}
}