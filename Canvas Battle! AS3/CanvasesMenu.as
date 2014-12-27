package
{	
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	import flash.display.Bitmap;
	import flash.display.MovieClip;

	public class CanvasesMenu extends AlertMenu
	{
		private var cButton:SimpleButton;
		private var previewBitmap:Bitmap;
		private var pBox:MovieClip;
		private var selector:MovieClip;
		private var selector2:MovieClip;
		
		public function CanvasesMenu(c:Boolean = false) 
		{
			super(300,150,c);
			
			if(!clone)
			{
				cButton = (getChildByName("closeButton") as SimpleButton);
				pBox = (getChildByName("previewBox") as MovieClip);
				selector = (getChildByName("buttonSelector") as MovieClip);
				selector2 = (getChildByName("buttonSelector2") as MovieClip);
				selector2.visible = false;
				previewBitmap = new Bitmap();
				
				if(CanvasManager.getCurrentCanvasBitmap()!=null)
					setPreviewBitmap(CanvasManager.getCurrentCanvasBitmap());
					
				if(CanvasManager.getCurrentCanvasButton() == null)
				{
					selector.visible = false;
					selector2.visible = true;
				}
				else
				{
					for(var i = 0;i<numChildren;i++)
						if(getChildAt(i) is CanvasButton)
							if(getChildAt(i).name == CanvasManager.getCurrentCanvasButton().name)
							{
								selector.x = getChildAt(i).x;
								selector.y = getChildAt(i).y;
							}
				}
				cButton.addEventListener(MouseEvent.CLICK,handleClose);
			}
		}
		public function getSelector():MovieClip
		{
			return selector;
		}
		public function getSelector2():MovieClip
		{
			return selector2;
		}
		public function handleClose(evt:MouseEvent):void
		{
			GameManager.getTimeline().toggleGamePause();
		}
		public override function removeFromStage():void
		{
			cButton.removeEventListener(MouseEvent.CLICK,handleClose);
			
			(getChildByName("customCanvasButton") as CustomCanvasButton).removeListeners();
			for(var i = 0;i<numChildren;i++)
				if(getChildAt(i) is CanvasButton)
					(getChildAt(i) as CanvasButton).removeListeners();
			
			cButton = null;
			previewBitmap = null;
			pBox = null;
			selector = null;
			selector2 = null;
			
			stage.focus = stage;
			super.removeFromStage();
		}
		public function setPreviewBitmap(b:Bitmap):void
		{
			while(pBox.numChildren<0)
				pBox.removeChild(pBox.childAt(0));
				
			previewBitmap = new Bitmap(b.bitmapData);
			previewBitmap.x = -(pBox.getChildByName("box") as MovieClip).width/2;
			previewBitmap.y = -(pBox.getChildByName("box") as MovieClip).height/2-1;
			previewBitmap.width = (pBox.getChildByName("box") as MovieClip).width+1;
			previewBitmap.height = (pBox.getChildByName("box") as MovieClip).height+2;
			pBox.addChild(previewBitmap);
		}
	}
}