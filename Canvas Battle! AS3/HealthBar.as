package  
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.geom.ColorTransform;
	import flash.events.Event;
	
	public class HealthBar extends Entity
	{
		protected var parentEntity:LivingEntity;
		protected var scale:Number;
		protected var flashing:Boolean;
		protected var flashTimer:Number;
		protected var color:ColorTransform;
		protected var defaultColor:ColorTransform;
		
		public function HealthBar(xpos:Number,ypos:Number,entity:LivingEntity,s:Number,c:ColorTransform,cl:Boolean = false)
		{
			super(xpos,ypos,0,0,null,cl);
			parentEntity = entity;
			scale = s;
			color = c;
			defaultColor = c;
			fillWithColor(color);
			
			if(!clone)
			{
				width = entity.getHealth()/scale;
				height = 15;
				flashTimer = 0;
				flashing = false;
				GameManager.getMiscList().addObject(this);
			}
		}
		public function isFlashing():Boolean
		{
			return flashing;
		}
		public override function removeFromStage():void
		{
			GameManager.getMiscList().removeObject(this);
			parentEntity = null;
			color = null;
			defaultColor = null;
			super.removeFromStage();
		}
		public function setColor(c:ColorTransform):void
		{
			defaultColor = c;
			color = c;
			fillWithColor(color);
		}
		public function updateSize(amount:Number):void
		{
			width = (parentEntity.getHealth()+amount)/scale;
		}
		public override function getClone():Entity
		{
			return new HealthBar(x,y,parentEntity,scale,defaultColor,true);
		}
		public function startFlashing():void
		{
			flashing = true;
		}
		public function stopFlashing():void
		{
			flashing = false;
			fillWithColor(defaultColor);
		}
		public function changeColor():void
		{
			if(color == defaultColor)
			{
				if(color.redOffset == 0  && color.blueOffset == 0 && color.greenOffset == 0)
					color = new ColorTransform(0,0,0,1,120,120,120);
				else
					color = new ColorTransform(0,0,0,1,defaultColor.redOffset/2,defaultColor.greenOffset/2,defaultColor.blueOffset/2);
			}
			else
				color = defaultColor;
			fillWithColor(color);
		}
		public override function updateTimedVariables(evt:Event):void
		{
			if(!GameManager.gameIsPaused())
			{
				if(flashing)
				{
					if(flashTimer<30)
						flashTimer++;
					else
					{
						if(!(this is BossHealthBar) || !(this as BossHealthBar).isFlickering())
						{
							flashTimer = 0;
							changeColor();
						}
					}
				}
			}
		}
	}
}