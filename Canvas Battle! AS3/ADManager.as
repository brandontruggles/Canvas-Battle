package  
{	
	import flash.events.Event;
	import flash.display.Stage;
	
	public class ADManager 
	{
		private static var ads:FGLAds;
		private static var ready:Boolean;
		
		public static function init(s:Stage):void
		{
			ready = false;
			ads = new FGLAds(s, "FGL-20028897");
			ads.addEventListener(FGLAds.EVT_API_READY, triggerReady);
		}
		public static function isReady():Boolean
		{
			return ready;
		}
		public static function showAd():void
		{
			ads.showAdPopup(FGLAds.FORMAT_300x250,3000,0);
		}
		private static function triggerReady(evt:Event):void
		{
			ready = true;
		}
	}
}
