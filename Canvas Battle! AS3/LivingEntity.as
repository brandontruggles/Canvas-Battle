package  
{
	public class LivingEntity extends Entity
	{
		protected var health:Number;
		protected var damage:Number;
		protected var invulnerable:Boolean;
		
		public function LivingEntity(xpos:Number,ypos:Number,h:Number,c:Boolean = false)
		{
			super(xpos,ypos,0,0,null,c);
			health = h;
			damage = 0;
			invulnerable = false;
		}
		public override function getClone():Entity
		{
			return new LivingEntity(x,y,health,true);
		}
		public function getHealth():Number
		{
			return health;
		}
		public function getDamage():Number
		{
			return damage;
		}
		public function isInvulnerable():Boolean
		{
			return invulnerable;
		}
		public function takeDamage(amount:Number,src:Entity = null):void
		{
			updateHealth(-amount);
		}
		public function setInvulnerable(b:Boolean):void
		{
			invulnerable = b;
		}
		public function updateHealth(amount:Number):void
		{
			health+=amount;
			
			if(health<=0)
				die();
		}
		public function die():void
		{
			removeFromStage();
		}
	}
}