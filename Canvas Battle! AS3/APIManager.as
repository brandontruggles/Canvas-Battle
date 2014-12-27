package  
{	
	public class APIManager 
	{
		private static var apiReference:Object;
		private static var initialized:Boolean = false;
		
		public static function init(reference:Object):void
		{
			apiReference = reference;
			
			if(apiReference != null)
				apiReference.services.connect();
				
			initialized = true;
		}
		public static function isInitialized():Boolean
		{
			return initialized;
		}
		public static function playerIsGuest():Boolean
		{
			if(apiReference != null)
				return apiReference.services.isGuest();
			return false;
		}
		public static function getAPIReference():Object
		{
			return apiReference;
		}
		public static function showRegistrationBox():void
		{
			if(apiReference != null)
				apiReference.services.showRegistrationBox();
		}
		public static function submitSingleEasyScore():void
		{
			if(apiReference != null)
				apiReference.stats.submit("SingleEasyScore",GameManager.getScore());
		}
		public static function submitSingleMediumScore():void
		{
			if(apiReference != null)
				apiReference.stats.submit("SingleMediumScore",GameManager.getScore());
		}
		public static function submitSingleHardScore():void
		{
			if(apiReference != null)
				apiReference.stats.submit("SingleHardScore",GameManager.getScore());
		}
		public static function submitMultiEasyScore():void
		{
			if(apiReference != null)
				apiReference.stats.submit("MultiEasyScore",GameManager.getScore());
		}
		public static function submitMultiMediumScore():void
		{
			if(apiReference != null)
				apiReference.stats.submit("MultiMediumScore",GameManager.getScore());
		}
		public static function submitMultiHardScore():void
		{
			if(apiReference != null)
				apiReference.stats.submit("MultiHardScore",GameManager.getScore());
		}
		public static function submitPaintapedeKilled():void
		{
			if(apiReference != null)
				apiReference.stats.submit("PaintapedeKilled",1);
		}
		public static function submitChaoticBossKilled():void
		{
			if(apiReference != null)
				apiReference.stats.submit("ChaoticBossKilled",1);
		}
		public static function submitWaterBossKilled():void
		{
			if(apiReference != null)
				apiReference.stats.submit("WaterBossKilled",1);
		}
		public static function submitPaintBrushBossKilled():void
		{
			if(apiReference != null)
				apiReference.stats.submit("PaintBrushBossKilled",1);
		}
		public static function submitVisitedChaosDimension():void
		{
			if(apiReference != null)
				apiReference.stats.submit("VisitedChaosDimension",1);
		}
		public static function submitCollectedAllCanvases():void
		{
			if(apiReference != null)
				apiReference.stats.submit("CollectedAllCanvases",1);
		}
	}
	
}