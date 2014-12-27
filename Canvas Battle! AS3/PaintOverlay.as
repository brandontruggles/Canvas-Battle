package  
{	
	import flash.display.BitmapData;
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.geom.Rectangle;
	import flash.geom.ColorTransform;

	public class PaintOverlay extends Entity
	{
		private var bitmapData:BitmapData;
		private var bitmap:Bitmap;
		
		public function PaintOverlay(c:Boolean = false) 
		{
			super(0,0,0,0,null,c);
			bitmapData = new BitmapData(width,height,true,0x00000000);
			bitmap = new Bitmap(bitmapData);
			addChild(bitmap);
			GameManager.getMiscList().addObject(this);
		}
		public override function getClone():Entity
		{
			return new PaintOverlay(true);
		}
		public function clean():void
		{
			bitmapData = new BitmapData(width,height,true,0x00000000);
			bitmap.bitmapData = bitmapData;
		}
		public override function addToParent(p:Object):void
		{
			super.addToParent(p);
			p.setChildIndex(this,CanvasManager.getCanvasIndex()+1);
		}
		public function addDrawing(m:MovieClip):void
		{
			bitmapData.draw(m,m.transform.matrix,m.transform.colorTransform);
		}
		public function addBlankDrawing(m:MovieClip):void
		{
			bitmapData.draw(m,m.transform.matrix,null,"erase");
		}
		public override function removeFromStage():void
		{
			GameManager.getMiscList().removeObject(this);
			bitmap = null;
			bitmapData = null;
			super.removeFromStage();
		}
	}
}
