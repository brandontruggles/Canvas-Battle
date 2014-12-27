package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class Missile extends Entity
	{
		protected var damage:Number;
		protected var sourceEntity:Entity;
		protected var imageTimer:Number;
		
		public function Missile(entity:Entity,dmg:Number,c:Boolean = false) 
		{
			super(entity.x,entity.y,0,0,null,c);
			sourceEntity = entity;
			damage = dmg;
			
			if(!clone)
			{
				imageTimer = 0;
				GameManager.getMiscList().addObject(this);
			}
		}
		public override function getClone():Entity
		{
			return new Missile(sourceEntity,damage,true);
		}
		public function getSourceEntity():Entity
		{
			return sourceEntity;
		}
		public override function updateTimedVariables(evt:Event):void
		{
			if(!GameManager.gameIsPaused())
			{
				processTimeSlow();
				travel();
			}
		}
		public function processTimeSlow():void
		{
			if(GameManager.timeIsSlowed())
			{
				if(imageTimer<5)
					imageTimer++;
				else
				{
					attachFade();
					imageTimer = 0;
				}
			}
		}
		public override function checkCollision():void
		{
			
		}
		public override function addToParent(p:Object):void
		{
			super.addToParent(p);
			p.setChildIndex(this,CanvasManager.getCanvasIndex()+2);
		}
		public override function removeFromStage():void
		{
			super.removeFromStage();
			GameManager.getMiscList().removeObject(this);
			sourceEntity = null;
		}
	}
	
}