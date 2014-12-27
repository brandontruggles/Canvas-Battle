package  
{	
	import flash.display.Bitmap;
	
	public class BackgroundCanvas extends Entity
	{
		private var bitmap:Bitmap;
		
		public function BackgroundCanvas(b:Bitmap,c:Boolean = false)
		{
			super(300,150,0,0,null,c);
			bitmap = new Bitmap(b.bitmapData);
			bitmap.x = -width/2;
			bitmap.y = -height/2;
			bitmap.width = width;
			bitmap.height = height;
			addChild(bitmap);
		}
		public override function getClone():Entity
		{
			return new BackgroundCanvas(bitmap,true);
		}
		public override function addToParent(p:Object):void
		{
			super.addToParent(p);
			parent.setChildIndex(this,0);
		}
		public override function removeFromStage():void
		{
			bitmap = null;
			super.removeFromStage();
		}
	}
}