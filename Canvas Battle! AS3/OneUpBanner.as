package  
{
	import flash.events.Event;

	public class OneUpBanner extends PowerUpBanner
	{
		public function OneUpBanner(e:Entity,c:Boolean = false)
		{
			super(e,c);
			originalHeight = height;
		}
		public override function getClone():Entity
		{
			return new OneUpBanner(null,true);
		}
	}
}
