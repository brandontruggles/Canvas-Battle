package 
{	
	public class BluePaintapedeHead extends PaintapedeHead
	{
		public function BluePaintapedeHead(xpos:Number,ypos:Number,m:Minipede,c:Boolean = false) 
		{
			super(xpos,ypos,140,m,c);
			if(!clone)
				hitRadius = 31;
		}
		public override function getClone():Entity
		{
			return new BluePaintapedeHead(x,y,host,true);
		}
		public override function explode():void
		{
			super.explode();
			var explosion:SecondPaintapedeExplosion = new SecondPaintapedeExplosion(this);
			explosion.addToParent(GameManager.getTimeline());
		}
	}
}