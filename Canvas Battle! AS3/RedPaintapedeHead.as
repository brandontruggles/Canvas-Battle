package 
{	
	public class RedPaintapedeHead extends PaintapedeHead
	{
		public function RedPaintapedeHead(xpos:Number,ypos:Number,m:Minipede,c:Boolean = false) 
		{
			super(xpos,ypos,100,m,c);
			if(!clone)
				hitRadius = 27.5;
		}
		public override function getClone():Entity
		{
			return new RedPaintapedeHead(x,y,host,true);
		}
		public override function explode():void
		{
			super.explode();
			var explosion:FourthPaintapedeExplosion = new FourthPaintapedeExplosion(this);
			explosion.addToParent(GameManager.getTimeline());
		}
	}
}