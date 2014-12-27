package  
{
	import flash.geom.ColorTransform;
	import flash.events.Event;
	
	public class PlayerHealthBar extends HealthBar
	{
		public function PlayerHealthBar(xpos:Number,ypos:Number,entity:PlayerBall,c:Boolean = false) 
		{
			super(xpos,ypos,entity,1,entity.getColor(),c);
		}
		public override function getClone():Entity
		{
			return new PlayerHealthBar(x,y,(parentEntity as PlayerBall),true);
		}
	}
}