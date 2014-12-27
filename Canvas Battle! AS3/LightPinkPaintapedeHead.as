package 
{	
	public class LightPinkPaintapedeHead extends PaintapedeHead
	{
		public function LightPinkPaintapedeHead(xpos:Number,ypos:Number,m:Minipede,c:Boolean = false) 
		{
			super(xpos,ypos,40,m,c);
			if(!clone)
				hitRadius = 14.5;
		}
		public override function getClone():Entity
		{
			return new LightPinkPaintapedeHead(x,y,host,true);
		}
		public override function explode():void
		{
			super.explode();
			var explosion:SeventhPaintapedeExplosion = new SeventhPaintapedeExplosion(this);
			explosion.addToParent(GameManager.getTimeline());
		}
	}
}