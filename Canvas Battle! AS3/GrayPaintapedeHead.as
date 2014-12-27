package 
{	
	public class GrayPaintapedeHead extends PaintapedeHead
	{
		public function GrayPaintapedeHead(xpos:Number,ypos:Number,m:Minipede,c:Boolean = false) 
		{
			super(xpos,ypos,20,m,c);
			if(!clone)
				hitRadius = 8;
		}
		public override function getClone():Entity
		{
			return new GrayPaintapedeHead(x,y,host,true);
		}
		public override function explode():void
		{
			super.explode();
			var explosion:EighthPaintapedeExplosion = new EighthPaintapedeExplosion(this);
			explosion.addToParent(GameManager.getTimeline());
		}
	}
}