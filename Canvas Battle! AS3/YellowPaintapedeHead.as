package 
{	
	public class YellowPaintapedeHead extends PaintapedeHead
	{
		public function YellowPaintapedeHead(xpos:Number,ypos:Number,m:Minipede,c:Boolean = false) 
		{
			super(xpos,ypos,60,m,c);
			if(!clone)
				hitRadius = 22;
		}
		public override function getClone():Entity
		{
			return new YellowPaintapedeHead(x,y,host,true);
		}
		public override function explode():void
		{
			super.explode();
			var explosion:SixthPaintapedeExplosion = new SixthPaintapedeExplosion(this);
			explosion.addToParent(GameManager.getTimeline());
		}
	}
}