package  
{
	import flash.utils.getQualifiedClassName;
	
	public class ArrayList 
	{
		private var array:Array;
		
		public function ArrayList() 
		{
			array = new Array();
		}
		public function getObject(i:Number):Object
		{
			return array[i];
		}
		public function indexOfObject(item):Number
		{
			return array.indexOf(item);
		}
		public function listSize():Number
		{
			return array.length;
		}
		public function containsObject(item):Boolean
		{
			var found:Boolean = false;
			
			for(var i = 0;i<array.length;i++)
				if(array[i] == item)
					found = true;
					
			return found;
		}
		public function addObject(item):void
		{
			array.push(item);
		}
		public function removeObject(item):void
		{
			var tempArray:Array = array;
			array = new Array();
			
			for(var i = 0;i<tempArray.length;i++)
				if(tempArray[i]!=item)
					array.push(tempArray[i]);
					
			tempArray = null;
		}
		public function toString():String
		{
			return getQualifiedClassName(this) + ": " + array;
		}
	}
}