package
{	
	import flash.events.Event;

	public class ChaoticBomb extends Entity
	{
		private var explosionTimer:Number;
		
		public function ChaoticBomb(xpos:Number,ypos:Number,c:Boolean = false)
		{
			super(xpos,ypos,0,0,null,c);
			
			if(!clone)
			{
				explosionTimer = 0;
				hitRadius = 5;
				alpha = 0;
				GameManager.getMiscList().addObject(this);
			}
		}
		public override function getClone():Entity
		{
			return new ChaoticBomb(x,y,true);
		}
		public override function addToParent(p:Object):void
		{
			super.addToParent(p);
			p.setChildIndex(this,CanvasManager.getCanvasIndex()+2);
		}
		public override function updateTimedVariables(evt:Event):void
		{
			if(!GameManager.gameIsPaused())
			{
				if(alpha+.1<1)
				{
					alpha+=.1;
				}
				else
					alpha = 1;
				
				if(alpha == 1)
				{
					if(explosionTimer<120)
						explosionTimer++;
					else
						explode();
					
					for(var i = 0;i<GameManager.getPlayerList().listSize();i++)
						if(GameManager.getPlayerList().getObject(i).hitTestObject(this) && !(GameManager.getPlayerList().getObject(i) as PlayerBall).isInvulnerable())
							explode();
				}
			}
		}
		public function explode():void
		{
			var explosion:ChaoticBombExplosion = new ChaoticBombExplosion(this);
			explosion.addToParent(GameManager.getTimeline());
			removeFromStage();
		}
		public override function removeFromStage():void
		{
			GameManager.getMiscList().removeObject(this);
			super.removeFromStage();
		}
	}
}