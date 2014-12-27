package  
{	
	import flash.geom.ColorTransform;

	public class PaintSwipe extends Missile
	{
		public function PaintSwipe(p:PaintBrushBoss,c:Boolean = false) 
		{
			super(p,20,c);
			
			if(!clone)
			{
				xVelocity = 12;
				damage = 20;
			}
			
			fillWithColor(new ColorTransform(1,1,1,1,Math.round(Math.random()*255),Math.round(Math.random()*255),Math.round(Math.random()*255)));
		}
		public override function getClone():Entity
		{
			return new PaintSwipe((sourceEntity as PaintBrushBoss),true);
		}
		public override function checkCollision():void
		{
			for(var i = 0;i<GameManager.getPlayerList().listSize();i++)
			{
				var player:Entity = (GameManager.getPlayerList().getObject(i) as Entity);
				
				if(hitTestObject((player as PlayerBall).getShield()) && (player as PlayerBall).getShield().visible && !(player as PlayerBall).isInvulnerable())
				{
					(player as PlayerBall).getShield().takeDamage(damage);
				}
				if(hitTestObject(player) && !(player as PlayerBall).isInvulnerable())
				{
					if(!(player as PlayerBall).isShielding())
						(player as PlayerBall).takeDamage(damage);
				}
			}
		}
		public override function travel():void
		{
			checkCollision();
			if(x>-150)
				x-=xVelocity;
			else
				removeFromStage();
		}
	}
}
