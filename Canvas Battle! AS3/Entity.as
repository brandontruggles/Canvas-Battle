package  
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.ColorTransform;
	import flash.display.DisplayObject;
	import flash.display.BitmapData;
	import flash.display.Bitmap;
	import flash.geom.Matrix;
	import flash.utils.getQualifiedClassName;

	public class Entity extends MovieClip
	{
		protected var xVelocity:Number;
		protected var yVelocity:Number;
		protected var hitRadius:Number;
		protected var stoppingList:ArrayList;
		protected var clone:Boolean;
		
		public function Entity(xpos:Number,ypos:Number,childXOffset:Number = 0,childYOffset:Number = 0,o:DisplayObject = null,c:Boolean = false)
		{
			x = xpos;
			y = ypos;
			xVelocity = 0;
			yVelocity = 0;
			hitRadius = 0;
			clone = c;
			if(o!=null)
			{
				addChild(o);
				o.x = childXOffset;
				o.y = childYOffset;
			}
			stoppingList = new ArrayList();
			
			if(!clone)
				addEventListener(Event.ENTER_FRAME,updateTimedVariables);
		}
		public function stopsAtFrame(frame:Number):Boolean
		{
			return stoppingList.containsObject(frame);
		}
		public function getClone():Entity
		{
			return new Entity(x,y,0,0,null,true);
		}
		public function getXVelocity():Number
		{
			return xVelocity;
		}
		public function getYVelocity():Number
		{
			return yVelocity;
		}
		public function getHitRadius():Number
		{
			return hitRadius;
		}
		public function isClone():Boolean
		{
			return clone;
		}
		public function hittingEntity(entity:Entity)
		{
			var distanceBetween:Number = Math.sqrt((entity.x-x)*(entity.x-x)+(entity.y-y)*(entity.y-y));
			if(distanceBetween<hitRadius+entity.getHitRadius())
				return true;
			return false;
		}
		public function attachFade():void
		{
			var fade:EntityFade = new EntityFade(this);
			fade.addToParent(GameManager.getTimeline());
		}
		public function startPlaying():void
		{	
			startAllInstancesOf(this);
		}
		public function stopPlaying():void
		{
			stopAllInstancesOf(this);
		}
		public function startAllInstancesOf(m:MovieClip):void
		{
			for(var i = 0;i<m.numChildren;i++)
			{
				if(m.getChildAt(i) is MovieClip)
					startAllInstancesOf((m.getChildAt(i) as MovieClip));
			}
			if(m is Entity)
			{
				if(!(m as Entity).stopsAtFrame(m.currentFrame))
					m.play();
			}
			else
				m.play();
		}
		public function stopAllInstancesOf(m:MovieClip):void
		{
			for(var i = 0;i<m.numChildren;i++)
			{
				if(m.getChildAt(i) is MovieClip)
				{
					stopAllInstancesOf((m.getChildAt(i) as MovieClip));
				}
			}
			m.stop();
		}
		public function updateTimedVariables(evt:Event):void
		{
			
		}
		public function checkCollision():void
		{
			
		}
		public function moveLeftByAmount(v:Number):void
		{
			x-=v;
		}
		public function moveRightByAmount(v:Number):void
		{
			x+=v;
		}
		public function moveUpByAmount(v:Number):void
		{
			y-=v;
		}
		public function moveDownByAmount(v:Number):void
		{
			y+=v;
		}
		public function setXVelocity(v:Number):void
		{
			xVelocity = v;
		}
		public function setYVelocity(v:Number):void
		{
			yVelocity = v;
		}
		public function travel():void
		{
			
		}
		public function moveLeft():void
		{
			x-=xVelocity;
		}
		public function moveRight():void
		{
			x+=xVelocity;
		}
		public function moveUp():void
		{
			y-=yVelocity;
		}
		public function moveDown():void
		{
			y+=yVelocity;
		}
		public function fillWithColor(c:ColorTransform):void
		{
			transform.colorTransform = c;
		}
		public function addToParent(p:Object):void
		{
			p.addChild(this);
		}
		public function removeListeners():void
		{
			removeEventListener(Event.ENTER_FRAME,updateTimedVariables);
		}
		public function removeFromStage():void
		{
			removeListeners();
			stoppingList = null;
			if(parent!=null)
			parent.removeChild(this);
		}
		public override function toString():String
		{
			return getQualifiedClassName(this) + " @ X: " +x +" Y: " +y;
		}
	}
}