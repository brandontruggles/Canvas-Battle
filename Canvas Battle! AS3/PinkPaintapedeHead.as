package 
{	
	public class PinkPaintapedeHead extends PaintapedeHead
	{
		public function PinkPaintapedeHead(xpos:Number,ypos:Number,m:Minipede,c:Boolean = false) 
		{
			super(xpos,ypos,120,m,c);
			if(!clone)
				hitRadius = 29;
		}
		public override function getClone():Entity
		{
			return new PinkPaintapedeHead(x,y,host,true);
		}
		public override function explode():void
		{
			super.explode();
			var explosion:ThirdPaintapedeExplosion = new ThirdPaintapedeExplosion(this);
			explosion.addToParent(GameManager.getTimeline());
		}
	}
}