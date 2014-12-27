package 
{	
	import flash.display.MovieClip;
	import flash.text.TextField;
	import flash.geom.ColorTransform;

	public class ComboBucket extends Entity
	{
		private var bucketPaint:MovieClip;
		private var bucketText:TextField;
		private var player:PlayerBall;
		
		public function ComboBucket(xpos:Number,ypos:Number,entity:PlayerBall,c:Boolean = false) 
		{
			super(xpos,ypos,0,0,null,c);
			
			if(!clone)
			{
				player = entity;
				bucketPaint = (getChildByName("paint") as MovieClip);
				bucketText = (getChildByName("comboText") as TextField);
			}
			
			fillWithColor(entity.getColor());
		}
		public override function getClone():Entity
		{
			return new ComboBucket(x,y,player,true);
		}
		public override function addToParent(p:Object):void
		{
			super.addToParent(p);
			GameManager.getMiscList().addObject(this);
		}
		public override function fillWithColor(c:ColorTransform):void
		{
			bucketPaint.transform.colorTransform = c;
		}
		public function updateSelf():void
		{
			if(bucketPaint.height<24)
				bucketPaint.height+=4;
			else
			{
				bucketPaint.height = 4;
				bucketText.text = player.getCombo() + "x";
			}
		}
		public function resetSelf():void
		{
			bucketPaint.height = 4;
			bucketText.text = player.getCombo() + "x";
		}
		public override function removeFromStage():void
		{
			GameManager.getMiscList().removeObject(this);
			bucketPaint = null;
			bucketText = null;
			player = null;
			super.removeFromStage();
		}
	}
}