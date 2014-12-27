package 
{	
	import flash.display.Bitmap;
	
	public class CanvasManager 
	{
		private static var currentCanvasBitmap:Bitmap;
		private static var backgroundCanvas:BackgroundCanvas;
		private static var backgroundIndex:Number;
		private static var canvasCounter:Number;
		private static var canvasButton:CanvasButton;
		private static var firstCanvasUnlocked:Boolean;
		private static var secondCanvasUnlocked:Boolean;
		private static var thirdCanvasUnlocked:Boolean;
		private static var fourthCanvasUnlocked:Boolean;
		private static var fifthCanvasUnlocked:Boolean;
		private static var sixthCanvasUnlocked:Boolean;
		private static var seventhCanvasUnlocked:Boolean;
		private static var eighthCanvasUnlocked:Boolean;
		private static var ninethCanvasUnlocked:Boolean;
		private static var tenthCanvasUnlocked:Boolean;
		private static var eleventhCanvasUnlocked:Boolean;
		private static var twelfthCanvasUnlocked:Boolean;
		private static var thirteenthCanvasUnlocked:Boolean;
		private static var fourteenthCanvasUnlocked:Boolean;
		private static var fifteenthCanvasUnlocked:Boolean;
		
		public static function init():void
		{
			currentCanvasBitmap = new Bitmap();
			setCurrentCanvasBitmap(new Bitmap(new DefaultCanvas()));
			var c:CanvasesMenu = new CanvasesMenu();
			setCurrentCanvasButton(c.getChildByName("firstCanvasButton") as CanvasButton);
			GameManager.getMiscList().removeObject(c);
			c = null;
			canvasCounter = 1;
			firstCanvasUnlocked = false;
			secondCanvasUnlocked = false;
			thirdCanvasUnlocked = false;
			fourthCanvasUnlocked = false;
			fifthCanvasUnlocked = false;
			sixthCanvasUnlocked = false;
			seventhCanvasUnlocked = false;
			eighthCanvasUnlocked = false;
			ninethCanvasUnlocked = false;
			tenthCanvasUnlocked = false;
			eleventhCanvasUnlocked = false;
			twelfthCanvasUnlocked = false;
			thirteenthCanvasUnlocked = false;
			fourteenthCanvasUnlocked = false;
			fifteenthCanvasUnlocked = false;
			
			unlockFirstCanvas();
		}
		public static function getCurrentCanvasButton():CanvasButton
		{
			return canvasButton;
		}
		public static function getCurrentCanvasBitmap():Bitmap
		{
			return currentCanvasBitmap;
		}
		public static function getCanvasIndex():Number
		{
			return backgroundIndex;
		}
		public static function getNumberOfCanvasesUnlocked():Number
		{
			return canvasCounter;
		}
		public static function firstCanvasIsUnlocked():Boolean
		{
			return firstCanvasUnlocked;
		}
		public static function secondCanvasIsUnlocked():Boolean
		{
			return secondCanvasUnlocked;
		}
		public static function thirdCanvasIsUnlocked():Boolean
		{
			return thirdCanvasUnlocked;
		}
		public static function fourthCanvasIsUnlocked():Boolean
		{
			return fourthCanvasUnlocked;
		}
		public static function fifthCanvasIsUnlocked():Boolean
		{
			return fifthCanvasUnlocked;
		}
		public static function sixthCanvasIsUnlocked():Boolean
		{
			return sixthCanvasUnlocked;
		}
		public static function seventhCanvasIsUnlocked():Boolean
		{
			return seventhCanvasUnlocked;
		}
		public static function eighthCanvasIsUnlocked():Boolean
		{
			return eighthCanvasUnlocked;
		}
		public static function ninethCanvasIsUnlocked():Boolean
		{
			return ninethCanvasUnlocked;
		}
		public static function tenthCanvasIsUnlocked():Boolean
		{
			return tenthCanvasUnlocked;
		}
		public static function eleventhCanvasIsUnlocked():Boolean
		{
			return eleventhCanvasUnlocked;
		}
		public static function twelfthCanvasIsUnlocked():Boolean
		{
			return twelfthCanvasUnlocked;
		}
		public static function thirteenthCanvasIsUnlocked():Boolean
		{
			return thirteenthCanvasUnlocked;
		}
		public static function fourteenthCanvasIsUnlocked():Boolean
		{
			return fourteenthCanvasUnlocked;
		}
		public static function fifteenthCanvasIsUnlocked():Boolean
		{
			return fifteenthCanvasUnlocked;
		}
		public static function setCurrentCanvasButton(c:CanvasButton):void
		{
			canvasButton = c;
		}
		public static function setCurrentCanvasBitmap(b:Bitmap):void
		{
			currentCanvasBitmap = b;
			
			if(backgroundCanvas!=null)
			backgroundCanvas.removeFromStage();
			
			backgroundCanvas = new BackgroundCanvas(currentCanvasBitmap);
			backgroundCanvas.addToParent(GameManager.getTimeline());
			backgroundIndex = GameManager.getTimeline().getChildIndex(backgroundCanvas);
		}
		public static function performCheat():void
		{
			secondCanvasUnlocked = true;
			thirdCanvasUnlocked = true;
			fourthCanvasUnlocked = true;
			fifthCanvasUnlocked = true;
			sixthCanvasUnlocked = true;
			seventhCanvasUnlocked = true;
			eighthCanvasUnlocked = true;
			ninethCanvasUnlocked = true;
			tenthCanvasUnlocked = true;
			eleventhCanvasUnlocked = true;
			twelfthCanvasUnlocked = true;
			thirteenthCanvasUnlocked = true;
			fourteenthCanvasUnlocked = true;
			fifteenthCanvasUnlocked = true;
			canvasCounter = 15;
		}
		public static function unlockFirstCanvas():void
		{
			firstCanvasUnlocked = true;
		}
		public static function unlockSecondCanvas():void
		{
			secondCanvasUnlocked = true;
			canvasCounter++;
		}
		public static function unlockThirdCanvas():void
		{
			thirdCanvasUnlocked = true;
			canvasCounter++;
		}
		public static function unlockFourthCanvas():void
		{
			fourthCanvasUnlocked = true;
			canvasCounter++;
		}
		public static function unlockFifthCanvas():void
		{
			fifthCanvasUnlocked = true;
			canvasCounter++;
		}
		public static function unlockSixthCanvas():void
		{
			sixthCanvasUnlocked = true;
			canvasCounter++;
		}
		public static function unlockSeventhCanvas():void
		{
			seventhCanvasUnlocked = true;
			canvasCounter++;
		}
		public static function unlockEighthCanvas():void
		{
			eighthCanvasUnlocked = true;
			canvasCounter++;
		}
		public static function unlockNinethCanvas():void
		{
			ninethCanvasUnlocked = true;
			canvasCounter++;
		}
		public static function unlockTenthCanvas():void
		{
			tenthCanvasUnlocked = true;
			canvasCounter++;
		}
		public static function unlockEleventhCanvas():void
		{
			eleventhCanvasUnlocked = true;
			canvasCounter++;
		}
		public static function unlockTwelfthCanvas():void
		{
			twelfthCanvasUnlocked = true;
			canvasCounter++;
		}
		public static function unlockThirteenthCanvas():void
		{
			thirteenthCanvasUnlocked = true;
			canvasCounter++;
		}
		public static function unlockFourteenthCanvas():void
		{
			fourteenthCanvasUnlocked = true;
			canvasCounter++;
		}
		public static function unlockFifteenthCanvas():void
		{
			fifteenthCanvasUnlocked = true;
			canvasCounter++;
		}
	}
}