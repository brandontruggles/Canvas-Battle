package  
{
	import flash.events.Event;
	
	public class BulletEgg extends EnemyEgg
	{
		public function BulletEgg(xpos:Number,ypos:Number,c:Boolean = false)
		{
			super(xpos,ypos,c);
		}
		public override function getClone():Entity
		{
			return new BulletEgg(x,y,true);
		}
		public override function hatch():void
		{
			var powerUp:HealthPowerUp = new HealthPowerUp(x,y);
			powerUp.addToParent(parent);
			var upMissile:EggMissile = new EggMissile(this,0,-6);
			upMissile.rotation = -90;
			upMissile.addToParent(parent);
			var topRightMissile:EggMissile = new EggMissile(this,6,-6);
			topRightMissile.rotation = -45;
			topRightMissile.addToParent(parent);
			var rightMissile:EggMissile = new EggMissile(this,6,0);
			rightMissile.addToParent(parent);
			var bottomRightMissile:EggMissile = new EggMissile(this,6,6);
			bottomRightMissile.rotation = 45;
			bottomRightMissile.addToParent(parent);
			var downMissile:EggMissile = new EggMissile(this,0,6);
			downMissile.rotation = 90;
			downMissile.addToParent(parent);
			var bottomLeftMissile:EggMissile = new EggMissile(this,-6,6);
			bottomLeftMissile.rotation = 135;
			bottomLeftMissile.addToParent(parent);
			var leftMissile:EggMissile = new EggMissile(this,-6,0);
			leftMissile.rotation = 180;
			leftMissile.addToParent(parent);
			var topLeftMissile:EggMissile = new EggMissile(this,-6,-6);
			topLeftMissile.rotation = -135;
			topLeftMissile.addToParent(parent);
			super.hatch();
		}
		public override function explode():void
		{
			var explosion:BulletEggExplosion = new BulletEggExplosion(this);
			explosion.addToParent(GameManager.getTimeline());
			super.explode();
		}
	}
}