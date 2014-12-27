package 
{	
	import flash.display.MovieClip;
	import flash.display.BitmapData;
	import flash.display.Bitmap;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;
	import flash.utils.getQualifiedClassName;
	
	public class CanvasButton extends MovieClip
	{
		private var bitMap:Bitmap;
		private var bitmapData:BitmapData;
		private var hasTip:Boolean;
		private var canvasName:String;
		private var toolTip:ToolTip;
		
		public function CanvasButton()
		{
			stop();
			hasTip = false;
			if(name == "firstCanvasButton")
			{
				bitmapData = new DefaultCanvas();
				canvasName = "Blank Canvas";
				setUpBitmap();
				if(CanvasManager.firstCanvasIsUnlocked())
					enable();
			}
			else if(name == "secondCanvasButton")
			{
				bitmapData = new MatrigonyLogo();
				canvasName = "Matrigony Logo";
				setUpBitmap();
				if(CanvasManager.secondCanvasIsUnlocked())
					enable();
			}
			else if(name == "thirdCanvasButton")
			{
				bitmapData = new SkullCanvas();
				canvasName = "Dark Hills";
				setUpBitmap();
				if(CanvasManager.thirdCanvasIsUnlocked())
					enable();
			}
			else if(name == "fourthCanvasButton")
			{
				bitmapData = new HeartCanvas();
				canvasName = "Love";
				setUpBitmap();
				if(CanvasManager.fourthCanvasIsUnlocked())
					enable();
			}
			else if(name == "fifthCanvasButton")
			{
				bitmapData = new SuperPooperBrosCanvas();
				canvasName = "Super Pooper Bros (Youtube)";
				setUpBitmap();
				if(CanvasManager.fifthCanvasIsUnlocked())
					enable();
			}
			else if(name == "sixthCanvasButton")
			{
				bitmapData = new AnnasCanvas();
				canvasName = "Blazing Stars";
				setUpBitmap();
				if(CanvasManager.sixthCanvasIsUnlocked())
					enable();
			}
			else if(name == "seventhCanvasButton")
			{
				bitmapData = new SandCanvas();
				canvasName = "Colorful Sands";
				setUpBitmap();
				if(CanvasManager.seventhCanvasIsUnlocked())
					enable();
			}
			else if(name == "eighthCanvasButton")
			{
				bitmapData = new DreamCanvas();
				canvasName = "The Dream";
				setUpBitmap();
				if(CanvasManager.eighthCanvasIsUnlocked())
					enable();
			}
			else if(name == "ninethCanvasButton")
			{
				bitmapData = new NightmareCanvas();
				canvasName = "Nightmare";
				setUpBitmap();
				if(CanvasManager.ninethCanvasIsUnlocked())
					enable();
			}
			else if(name == "tenthCanvasButton")
			{
				bitmapData = new CityCanvas();
				canvasName = "City Pride";
				setUpBitmap();
				if(CanvasManager.tenthCanvasIsUnlocked())
					enable();
			}
			else if(name == "eleventhCanvasButton")
			{
				bitmapData = new GlitchCanvas();
				canvasName = "Glitch";
				setUpBitmap();
				if(CanvasManager.eleventhCanvasIsUnlocked())
					enable();
			}
			else if(name == "twelfthCanvasButton")
			{
				bitmapData = new ChaosCanvas();
				canvasName = "Chaotic Shadow";
				setUpBitmap();
				if(CanvasManager.twelfthCanvasIsUnlocked())
					enable();
			}
			else if(name == "thirteenthCanvasButton")
			{
				bitmapData = new WaterCanvas();
				canvasName = "Deep Sea";
				setUpBitmap();
				if(CanvasManager.thirteenthCanvasIsUnlocked())
					enable();
			}
			else if(name == "fourteenthCanvasButton")
			{
				bitmapData = new PaintapedeCanvas();
				canvasName = "Paintapede Portrait";
				setUpBitmap();
				if(CanvasManager.fourteenthCanvasIsUnlocked())
					enable();
			}
			else if(name == "fifteenthCanvasButton")
			{
				bitmapData = new CutsceneCanvas();
				canvasName = "Artist's Masterpiece";
				setUpBitmap();
				if(CanvasManager.fifteenthCanvasIsUnlocked())
					enable();
			}
			if(CanvasManager.getCurrentCanvasButton() == this)
			{
				(parent as CanvasesMenu).getSelector().x = x;
				(parent as CanvasesMenu).getSelector().y = y;
			}
			addEventListener(MouseEvent.MOUSE_MOVE,updateToolTip);
			addEventListener(MouseEvent.MOUSE_OUT,removeToolTip);
		}
		public function setUpBitmap():void
		{
			bitMap = new Bitmap(bitmapData);
			bitMap.x = -width/2;
			bitMap.y = -height/2;
			bitMap.width = width;
			bitMap.height = height;
		}
		public function enable():void
		{
			gotoAndStop(2);
			addChild(bitMap);
			addEventListener(MouseEvent.CLICK,processClick);
		}
		public function processClick(evt:MouseEvent):void
		{
			select();
		}
		public function select():void
		{
			if(!((parent as CanvasesMenu).getSelector().x == x && (parent as CanvasesMenu).getSelector().y == y))
			{
				GameManager.getPaintOverlay().clean();
				CanvasManager.setCurrentCanvasBitmap(bitMap);
				(parent as CanvasesMenu).setPreviewBitmap(bitMap);
				CanvasManager.setCurrentCanvasButton(this);
				(parent as CanvasesMenu).getSelector().x = x;
				(parent as CanvasesMenu).getSelector().y = y;
			}
		}
		public function updateToolTip(evt:MouseEvent):void
		{
			Mouse.cursor = "button";
			if(!hasTip)
			{
				if(currentFrame == 2)
					toolTip  = new ToolTip(stage.mouseX,stage.mouseY,canvasName,canvasName.length*10,25);
				else
					toolTip = new ToolTip(stage.mouseX,stage.mouseY,"Locked");
					
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
		public function removeToolTip(evt:MouseEvent):void
		{
			Mouse.cursor = "auto";
			if(hasTip)
			{
				toolTip.removeFromStage();
				toolTip = null;
				hasTip = false;
			}
		}
		public function removeListeners():void
		{
			removeToolTip(null);
			removeEventListener(MouseEvent.CLICK,processClick);
			removeEventListener(MouseEvent.MOUSE_OUT,removeToolTip);
			
			if(currentFrame == 2)
				removeEventListener(MouseEvent.MOUSE_MOVE,updateToolTip);
		}
		public override function toString():String
		{
			return getQualifiedClassName(this) + " @ X: " +x + " Y: " +y;
		}
	}
}