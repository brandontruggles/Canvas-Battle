package 
{	
	public class PaintBomb extends PowerUp
	{
		public function PaintBomb(xpos:Number,ypos:Number,c:Boolean = false) 
		{
			super(xpos,ypos,c);
		}
		public override function getClone():Entity
		{
			return new PaintBomb(x,y,true);
		}
		public override function useEffectOn(p:PlayerBall):void
		{
			var b:PaintBombExplosion = new PaintBombExplosion(this);
			b.addToParent(GameManager.getTimeline());
			super.useEffectOn(p);
		}
		public override function attachBannerToEntity(e:Entity):void
		{
			banner = new BombBanner(e);
			banner.addToParent(GameManager.getTimeline());
		}
	}
}