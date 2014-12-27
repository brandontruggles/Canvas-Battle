package
{	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.net.FileReference;
	import flash.net.FileFilter;
	import flash.events.Event;
	import flash.display.Loader;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.ui.Mouse;
	import flash.utils.getQualifiedClassName;
	
	public class CustomCanvasButton extends MovieClip
	{
		private var file:FileReference;
		private var loader:Loader;
		private var toolTip:ToolTip;
		private var hasTip:Boolean;
		
		public function CustomCanvasButton()
		{
			stop();
			file = new FileReference();
			loader = new Loader();
			hasTip = false;
			
			if(CanvasManager.getNumberOfCanvasesUnlocked() >= 5)
				enable();
				
			addEventListener(MouseEvent.MOUSE_MOVE,processMouseOver);
			addEventListener(MouseEvent.MOUSE_OUT,processMouseOut);
		}
		public function enable():void
		{
			gotoAndStop(2);
			addEventListener(MouseEvent.CLICK,processButtonPress);
		}
		public function processButtonPress(evt:MouseEvent):void
		{
			var fileTypes:FileFilter = new FileFilter("Images (*.jpg, *.jpeg, *.png)", "*.jpg;*.jpeg;*.png");
			file.browse([fileTypes]);
			file.addEventListener(Event.SELECT,processSelectedFile);
		}
		public function processMouseOver(evt:MouseEvent):void
		{
			Mouse.cursor = "button";
			if(!hasTip)
			{
				if(currentFrame == 2)
					toolTip = new ToolTip(stage.mouseX,stage.mouseY,"Custom Canvas",140,25);
				else
				{
					if(5-CanvasManager.getNumberOfCanvasesUnlocked()>1)
						toolTip = new ToolTip(stage.mouseX,stage.mouseY,"Unlock " + (5-CanvasManager.getNumberOfCanvasesUnlocked()) + " more canvases to be able to upload your own images!",160,80);
					else
						toolTip = new ToolTip(stage.mouseX,stage.mouseY,"Unlock " + (5-CanvasManager.getNumberOfCanvasesUnlocked()) + " more canvas to be able to upload your own images!",160,80);
				}
				toolTip.x = stage.mouseX+toolTip.width/2+5;
				toolTip.y = stage.mouseY-toolTip.height/2-5;
				toolTip.addToParent(GameManager.getTimeline());
				hasTip = true;
			}
			else
			{
				toolTip.x = stage.mouseX+toolTip.width/2+5;
				toolTip.y = stage.mouseY-toolTip.height/2-5;
			}
		}
		public function processMouseOut(evt:MouseEvent):void
		{
			Mouse.cursor = "auto";
			if(hasTip)
			{
				toolTip.removeFromStage();
				hasTip = false;
			}
		}
		public function processSelectedFile(evt:Event):void
		{
			file.addEventListener(Event.COMPLETE,loadFile);
			file.load();
		}
		public function loadFile(evt:Event):void
		{
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE,convertImageToCanvas);
			loader.loadBytes(file.data);
		}
		public function convertImageToCanvas(evt:Event):void
		{
			var bData:BitmapData = new BitmapData((loader as DisplayObject).width,(loader as DisplayObject).height);
			bData.draw((loader as DisplayObject));
			var bitmap:Bitmap = new Bitmap(bData);
			CanvasManager.setCurrentCanvasBitmap(bitmap);
			(parent as CanvasesMenu).setPreviewBitmap(bitmap);
			
			if((parent as CanvasesMenu).getSelector().visible)
				(parent as CanvasesMenu).getSelector().visible = false;
			if(!(parent as CanvasesMenu).getSelector2().visible)
				(parent as CanvasesMenu).getSelector2().visible = true;
				
			GameManager.getPaintOverlay().clean();
				
			CanvasManager.setCurrentCanvasButton(null);
		}
		public function removeListeners():void
		{
			processMouseOut(null);
			removeEventListener(MouseEvent.MOUSE_MOVE,processMouseOver);
			removeEventListener(MouseEvent.MOUSE_OUT,processMouseOut);
			
			if(currentFrame == 2)
			{
				removeEventListener(MouseEvent.CLICK,processButtonPress);
				file.removeEventListener(Event.SELECT,processSelectedFile);
				file.removeEventListener(Event.COMPLETE,loadFile);
				loader.contentLoaderInfo.removeEventListener(Event.COMPLETE,convertImageToCanvas);
			}
			file = null;
			loader = null;
			toolTip = null;
		}
		public override function toString():String
		{
			return getQualifiedClassName(this) + " @ X: " + x + " Y: " +y;
		}
	}
}