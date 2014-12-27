package  
{	
	public class BubbleExplosion extends Explosion
	{
		public function BubbleExplosion(entity:WaterBubble,c:Boolean = false)
		{
			super(entity,c);
		}
		public override function getClone():Entity
		{
			return new BubbleExplosion(null,true);
		}
	}
}