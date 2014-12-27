package 
{
	import flash.events.Event;
	
	public class Explosion extends Entity
	{
		protected var sourceEntity:Entity;
		
		public function Explosion(entity:Entity,c:Boolean = false)
		{
			super(0,0,0,0,null,c);
			
			sourceEntity = entity;
			if(sourceEntity!=null)
			{
				x = sourceEntity.x;
				y = sourceEntity.y;
			}
			stoppingList.addObject(totalFrames);
			if(!clone)
			{
				GameManager.getMiscList().addObject(this);
			}
		}
		public override function getClone():Entity
		{
			return new Explosion(null,true);
		}
		public function getSourceEntity():Entity
		{
			return sourceEntity;
		}
		public override function updateTimedVariables(evt:Event):void
		{ 
			if(!GameManager.gameIsPaused() && currentFrame == totalFrames)
			{
				var bottomAlphaValue:Number = .4;
				if(!(GameManager.overlayIsAllowed()) || (this is WaterBossExplosion) || (this is BubbleExplosion))
					bottomAlphaValue = 0;
				if(alpha>bottomAlphaValue)
					alpha-=.02;
				else
				{
					if(GameManager.overlayIsAllowed() && !(this is WaterBossExplosion) && !(this is BubbleExplosion))
						GameManager.getPaintOverlay().addDrawing(this);
					else if(GameManager.overlayIsAllowed() && ((this is WaterBossExplosion) || (this is BubbleExplosion)))
						GameManager.getPaintOverlay().addBlankDrawing(this);
					removeFromStage();
				}
			}
		}
		public override function addToParent(p:Object):void
		{
			super.addToParent(p);
			p.setChildIndex(this,CanvasManager.getCanvasIndex()+2);
		}
		public override function removeFromStage():void
		{
			GameManager.getMiscList().removeObject(this);
			sourceEntity = null;
			super.removeFromStage();
		}
	}
}