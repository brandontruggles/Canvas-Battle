package  
{
	import flash.events.Event;
	
	public class BrownBall extends MiniBoss
	{
		private var movingLeft:Boolean;
		private var yellowBallList:ArrayList;
		private var shootDir:Number;
		private var shootLimiter:Number;
		
		public function BrownBall(c:Boolean = false)
		{
			super(700,150,100,4,0,c);
			damage = 20;
			hitRadius = 30;
			pointValue = 750;
			shootLimiter = 0;
			movingLeft = true;
			if(!clone)
			{
				if(GameManager.getDifficulty() == 2)
					xVelocity = 3;
				else if(GameManager.getDifficulty() == 1)
					xVelocity = 2;
				yellowBallList = new ArrayList();
				var b1:YellowBall = new YellowBall(x+50,y,this);
				b1.addToParent(GameManager.getTimeline());
				var b2:YellowBall = new YellowBall(x+25,y+25,this);
				b2.addToParent(GameManager.getTimeline());
				var b3:YellowBall = new YellowBall(x,y+50,this);
				b3.addToParent(GameManager.getTimeline());
				var b4:YellowBall = new YellowBall(x-25,y+25,this);
				b4.addToParent(GameManager.getTimeline());
				var b5:YellowBall = new YellowBall(x-50,y,this);
				b5.addToParent(GameManager.getTimeline());
				var b6:YellowBall = new YellowBall(x-25,y-25,this);
				b6.addToParent(GameManager.getTimeline());
				var b7:YellowBall = new YellowBall(x,y-50,this);
				b7.addToParent(GameManager.getTimeline());
				var b8:YellowBall = new YellowBall(x+25,y-25,this);
				b8.addToParent(GameManager.getTimeline());
				yellowBallList.addObject(b1);
				yellowBallList.addObject(b2);
				yellowBallList.addObject(b3);
				yellowBallList.addObject(b4);
				yellowBallList.addObject(b5);
				yellowBallList.addObject(b6);
				yellowBallList.addObject(b7);
				yellowBallList.addObject(b8);
				shootDir = 0;
			}
		}
		public override function getClone():Entity
		{
			return new BrownBall(true);
		}
		public function getYellowBallList():ArrayList
		{
			return yellowBallList;
		}
		public override function moveLeft():void
		{
			super.moveLeft();
			for(var i = 0;i<yellowBallList.listSize();i++)
				yellowBallList.getObject(i).moveLeft();
		}
		public override function moveRight():void
		{
			super.moveRight();
			for(var i = 0;i<yellowBallList.listSize();i++)
				yellowBallList.getObject(i).moveRight();
		}
		public override function moveUp():void
		{
			super.moveUp();
			for(var i = 0;i<yellowBallList.listSize();i++)
				yellowBallList.getObject(i).moveUp();
		}
		public override function moveDown():void
		{
			super.moveDown();
			for(var i = 0;i<yellowBallList.listSize();i++)
				yellowBallList.getObject(i).moveDown();
		}
		public override function updateTimedVariables(evt:Event):void
		{
			super.updateTimedVariables(evt);
			if(!GameManager.gameIsPaused())
			{
				if(shootLimiter<15/GameManager.getDifficulty())
				{
					shootLimiter++;
				}
				else
				{
					shootLimiter = 0;
					if(shootDir<7)
						shootDir++;
					else
						shootDir = 0;
					
					var b:BrownMissile = null;
					if(shootDir == 0)
					{
						b = new BrownMissile(this,8,0);
					}
					else if(shootDir == 1)
					{
						b = new BrownMissile(this,8,-8);
						b.rotation = -45;
					}
					else if(shootDir == 2)
					{
						b = new BrownMissile(this,0,-8);
						b.rotation = -90;
					}
					else if(shootDir == 3)
					{
						b = new BrownMissile(this,-8,-8);
						b.rotation = -135;
					}
					else if(shootDir == 4)
					{
						b = new BrownMissile(this,-8,0);
						b.rotation = 180;
					}
					else if(shootDir == 5)
					{
						b = new BrownMissile(this,-8,8);
						b.rotation = 135;
					}
					else if(shootDir == 6)
					{
						b = new BrownMissile(this,0,8);
						b.rotation = 90;
					}
					else if(shootDir == 7)
					{
						b = new BrownMissile(this,8,8);
						b.rotation = 45;
					}
					b.addToParent(GameManager.getTimeline());
				}
				if(movingLeft)
				{
					if(x>70)
						moveLeft();
					else
						movingLeft = false;
				}
				else
				{
					if(x<530)
						moveRight();
					else
						movingLeft = true;
				}
			}
		}
		public override function die():void
		{
			explode();
			while(yellowBallList.listSize()>0)
				yellowBallList.getObject(0).die();
			super.die();
		}
		public function explode():void
		{
			var explosionRand:Number = (Math.round(Math.random()))+1;
			
			if(explosionRand == 1)
			{
				var firstExplosion:FirstBrownExplosion = new FirstBrownExplosion(this);
				firstExplosion.addToParent(GameManager.getTimeline());
			}
			else if(explosionRand == 2)
			{
				var secondExplosion:SecondBrownExplosion = new SecondBrownExplosion(this);
				secondExplosion.addToParent(GameManager.getTimeline());
			}
			
			var powerUpRand:Number = Math.round(Math.random()*4);
			
			if(powerUpRand == 0)
			{
				var h:HealthPowerUp = new HealthPowerUp(x,y);
				h.addToParent(GameManager.getTimeline());
			}
		}
		public override function removeFromStage():void
		{
			super.removeFromStage();
			
			while(yellowBallList.listSize()>0)
				yellowBallList.getObject(0).removeFromStage();
				
			yellowBallList = null;
		}
	}
}