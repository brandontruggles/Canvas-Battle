package  
{	
	public class ControlsManager
	{
		private static var leftKey:Number;
		private static var rightKey:Number;
		private static var upKey:Number;
		private static var downKey:Number;
		private static var shootKey:Number;
		private static var shieldKey:Number;
		private static var pauseKey:Number;
		private static var canvasKey:Number;
		private static var leftKey2:Number;
		private static var rightKey2:Number;
		private static var upKey2:Number;
		private static var downKey2:Number;
		private static var shootKey2:Number;
		private static var shieldKey2:Number;
		private static var leftLabel:String;
		private static var rightLabel:String;
		private static var upLabel:String;
		private static var downLabel:String;
		private static var shootLabel:String;
		private static var shieldLabel:String;
		private static var pauseLabel:String;
		private static var canvasLabel:String;
		private static var leftLabel2:String;
		private static var rightLabel2:String;
		private static var upLabel2:String;
		private static var downLabel2:String;
		private static var shootLabel2:String;
		private static var shieldLabel2:String;
		
		public static function init():void
		{
			leftKey = 65;
			rightKey = 68;
			upKey = 87;
			downKey = 83;
			shootKey = 32;
			shieldKey = 16;
			pauseKey = 80;
			canvasKey = 67;
			leftKey2 = 37;
			rightKey2 = 39;
			upKey2 = 38;
			downKey2 = 40;
			shootKey2 = 13;
			shieldKey2 = 17;
			leftLabel = "A";
			rightLabel = "D";
			upLabel = "W";
			downLabel = "S";
			shootLabel = "Space";
			shieldLabel = "Shift";
			pauseLabel = "P";
			canvasLabel = "C";
			leftLabel2 = "LArr";
			rightLabel2 = "RArr";
			upLabel2 = "UArr";
			downLabel2 = "DArr";
			shootLabel2 = "Enter";
			shieldLabel2 = "Ctrl";
		}
		public static function getP1LeftKey():Number
		{
			return leftKey;
		}
		public static function getP1RightKey():Number
		{
			return rightKey;
		}
		public static function getP1UpKey():Number
		{
			return upKey;
		}
		public static function getP1DownKey():Number
		{
			return downKey;
		}
		public static function getP1ShootKey():Number
		{
			return shootKey;
		}
		public static function getP1ShieldKey():Number
		{
			return shieldKey;
		}
		public static function getPauseKey():Number
		{
			return pauseKey;
		}
		public static function getCanvasKey():Number
		{
			return canvasKey;
		}
		public static function getP2LeftKey():Number
		{
			return leftKey2;
		}
		public static function getP2RightKey():Number
		{
			return rightKey2;
		}
		public static function getP2UpKey():Number
		{
			return upKey2;
		}
		public static function getP2DownKey():Number
		{
			return downKey2;
		}
		public static function getP2ShootKey():Number
		{
			return shootKey2;
		}
		public static function getP2ShieldKey():Number
		{
			return shieldKey2;
		}
		public static function getLeftLabel():String
		{
			return leftLabel;
		}
		public static function getRightLabel():String
		{
			return rightLabel;
		}
		public static function getUpLabel():String
		{
			return upLabel;
		}
		public static function getDownLabel():String
		{
			return downLabel;
		}
		public static function getShootLabel():String
		{
			return shootLabel;
		}
		public static function getShieldLabel():String
		{
			return shieldLabel;
		}
		public static function getPauseLabel():String
		{
			return pauseLabel;
		}
		public static function getCanvasLabel():String
		{
			return canvasLabel;
		}
		public static function getLeftLabel2():String
		{
			return leftLabel2;
		}
		public static function getRightLabel2():String
		{
			return rightLabel2;
		}
		public static function getUpLabel2():String
		{
			return upLabel2;
		}
		public static function getDownLabel2():String
		{
			return downLabel2;
		}
		public static function getShootLabel2():String
		{
			return shootLabel2;
		}
		public static function getShieldLabel2():String
		{
			return shieldLabel2;
		}
		public static function setP1LeftKey(k:Number):void
		{
			leftKey = k;
		}
		public static function setP1RightKey(k:Number):void
		{
			rightKey = k;
		}
		public static function setP1UpKey(k:Number):void
		{
			upKey = k;
		}
		public static function setP1DownKey(k:Number):void
		{
			downKey = k;
		}
		public static function setP1ShootKey(k:Number):void
		{
			shootKey = k;
		}
		public static function setP1ShieldKey(k:Number):void
		{
			shieldKey = k;
		}
		public static function setPauseKey(k:Number):void
		{
			pauseKey = k;
		}
		public static function setCanvasKey(k:Number):void
		{
			canvasKey = k;
		}
		public static function setP2LeftKey(k:Number):void
		{
			leftKey2 = k;
		}
		public static function setP2RightKey(k:Number):void
		{
			rightKey2 = k;
		}
		public static function setP2UpKey(k:Number):void
		{
			upKey2 = k;
		}
		public static function setP2DownKey(k:Number):void
		{
			downKey2 = k;
		}
		public static function setP2ShootKey(k:Number):void
		{
			shootKey2 = k;
		}
		public static function setP2ShieldKey(k:Number):void
		{
			shieldKey2 = k;
		}
		public static function setLeftLabel(s:String):void
		{
			leftLabel = s;
		}
		public static function setRightLabel(s:String):void
		{
			rightLabel = s;
		}
		public static function setUpLabel(s:String):void
		{
			upLabel = s;
		}
		public static function setDownLabel(s:String):void
		{
			downLabel = s;
		}
		public static function setShootLabel(s:String):void
		{
			shootLabel = s;
		}
		public static function setShieldLabel(s:String):void
		{
			shieldLabel = s;
		}
		public static function setPauseLabel(s:String):void
		{
			pauseLabel = s;
		}
		public static function setCanvasLabel(s:String):void
		{
			canvasLabel = s;
		}
		public static function setLeftLabel2(s:String):void
		{
			leftLabel2 = s;
		}
		public static function setRightLabel2(s:String):void
		{
			rightLabel2 = s;
		}
		public static function setUpLabel2(s:String):void
		{
			upLabel2 = s;
		}
		public static function setDownLabel2(s:String):void
		{
			downLabel2 = s;
		}
		public static function setShootLabel2(s:String):void
		{
			shootLabel2 = s;
		}
		public static function setShieldLabel2(s:String):void
		{
			shieldLabel2 = s;
		}
	}
}