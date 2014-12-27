package 
{	
	public class PalePaintapedeHead extends PaintapedeHead
	{
		public function PalePaintapedeHead(xpos:Number,ypos:Number,m:Minipede,c:Boolean = false) 
		{
			super(xpos,ypos,80,m,c);
			if(!clone)
				hitRadius = 26;
		}
		public override function getClone():Entity
		{
			return new PalePaintapedeHead(x,y,host,true);
		}
		public override function explode():void
		{
			super.explode();
			var explosion:FifthPaintapedeExplosion = new FifthPaintapedeExplosion(this);
			explosion.addToParent(GameManager.getTimeline());
		}
	}
}