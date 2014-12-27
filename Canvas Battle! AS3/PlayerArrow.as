package 
{	
	import flash.events.Event;

	public class PlayerArrow extends Entity
	{
		private var player:PlayerBall;
		
		public function PlayerArrow(p:PlayerBall,c:Boolean = false)
		{
			super(p.x+25,p.y,0,0,null,c);
			player = p;
			fillWithColor(player.getColor());
			
			if(!clone)
				GameManager.getMiscList().addObject(this);
		}
		public override function updateTimedVariables(evt:Event):void
		{
				if(player.getDirection() == 0)
				{
					rotation = -90;
					x = player.x;
					y = player.y-20;
				}
				else if(player.getDirection() == 1)
				{
					rotation = -45;
					x = player.x+14;
					y = player.y-14;
				}
				else if(player.getDirection() == 2)
				{
					rotation = 0;
					x = player.x+20;
					y = player.y;
				}
				else if(player.getDirection() == 3)
				{
					rotation = 45;
					x = player.x+14;
					y = player.y+14;
				}
				else if(player.getDirection() == 4)
				{
					rotation = 90;
					x = player.x;
					y = player.y+20;
				}
				else if(player.getDirection() == 5)
				{
					rotation = 135;
					x = player.x-14;
					y = player.y+14;
				}
				else if(player.getDirection() == 6)
				{
					rotation = 180;
					x = player.x-20;
					y = player.y;
				}
				else if(player.getDirection() == 7)
				{
					rotation = 225;
					x = player.x-14;
					y = player.y-14;
				}
				
				if(!player.visible)
				{
					if(visible)
						visible = false;
				}
				else
				{
					if(!visible)
						visible = true;
				}
		}
		public override function getClone():Entity
		{
			return new PlayerArrow(player,true);
		}
		public override function addToParent(p:Object):void
		{
			super.addToParent(p);
			p.setChildIndex(this,CanvasManager.getCanvasIndex()+2);
		}
		public override function removeFromStage():void
		{
			GameManager.getMiscList().removeObject(this);
			player = null;
			super.removeFromStage();
		}
	}
}