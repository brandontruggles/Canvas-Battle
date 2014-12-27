package 
{	
	import flash.utils.getQualifiedClassName;
	
	public class TutorialMessage 
	{
		private var tutorialMessage:String;
		
		public function TutorialMessage(msg:String) 
		{
			tutorialMessage = msg;
		}
		public function getMsg():String
		{
			return tutorialMessage;
		}
		public function toString():String
		{
			return getQualifiedClassName(this) + "w/ Message:"  + tutorialMessage;
		}
	}
}