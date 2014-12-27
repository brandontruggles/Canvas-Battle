package 
{	
	import flash.events.Event;
	
	public class Minipede extends Enemy implements ShootingEnabled
	{
		private var host:Paintapede;
		private var partsList:ArrayList;
		private var dir:Number;
		private var pseudoWidth:Number;
		private var pseudoHeight:Number;
		private var shootTimer:Number;
		private var shootLimiter:Number;
		private var centerX:Number;
		private var centerY:Number;
		
		public function Minipede(xpos:Number,ypos:Number,d:Number,p:Paintapede,c:Boolean = false) 
		{
			super(xpos,ypos,0,p.getXVelocity(),p.getYVelocity(),c);
			
			if(!clone)
			{
				host = p;
				dir = d;
				centerX = x;
				centerY = y;
				shootTimer = 0;
				invulnerable = true;
				shootLimiter = Math.round(Math.random()*2)+2;
				partsList = new ArrayList();
				damage = host.getDamage();
				pseudoWidth = host.getWidth();
				pseudoHeight = host.getHeight();
			}
		}
		public function getWidth():Number
		{
			return pseudoWidth;
		}
		public function getHeight():Number
		{
			return pseudoHeight;
		}
		public override function getClone():Entity
		{
			return new Minipede(x,y,dir,host,true);
		}
		public function getPartsList():ArrayList
		{
			return partsList;
		}
		public function getDirection():Number
		{
			return dir;
		}
		public function getShootLimiter():Number
		{
			return shootLimiter;
		}
		public override function updateTimedVariables(evt:Event):void
		{
			super.updateTimedVariables(evt);
			
			if(!GameManager.gameIsPaused())
			{
				if(dir == 0)
				{
					if(x>-200)
						moveLeft();
					else
						faceRandomDirection();
				}
				else if(dir == 1)
				{
					if(x<800)
						moveRight();
					else
						faceRandomDirection();
				}
				else if(dir == 2)
				{
					if(y>-200)
						moveUp();
					else
						faceRandomDirection();
				}
				else if(dir == 3)
				{
					if(y<400)
						moveDown();
					else
						faceRandomDirection();
				}
				
				updateCenter();
			}
		}
		public function updateCenter():void
		{
			if(partsList.listSize()>1)
			{
				if(partsList.listSize()%2!=0)
				{
					var centerIndex:Number = Math.round(partsList.listSize()/2)-1;
					centerX = partsList.getObject(centerIndex).x;
					centerY = partsList.getObject(centerIndex).y;
				}
				else if(partsList.listSize()%2 == 0)
				{
					var leftIndex:Number = partsList.listSize()/2-1;
					centerX = (partsList.getObject(leftIndex).x+partsList.getObject(leftIndex+1).x)/2;
					centerY = (partsList.getObject(leftIndex).y+partsList.getObject(leftIndex+1).y)/2;
				}
			}
			else
			{
				centerX = partsList.getObject(0).x;
				centerY = partsList.getObject(0).y;
			}
		}
		public override function moveLeft():void
		{
			super.moveLeft();
			
			for(var i = 0;i<partsList.listSize();i++)
				partsList.getObject(i).moveLeft();
			
			if(centerX>50 && centerX<550)
				if(shootTimer >= shootLimiter)
					if(Math.round(Math.random()*2)<=1)
						attack();
		}
		public override function moveRight():void
		{
			super.moveRight();
			
			for(var i = 0;i<partsList.listSize();i++)
				partsList.getObject(i).moveRight();
			
			if(centerX>50 && centerX<550)
				if(shootTimer >= shootLimiter)
					if(Math.round(Math.random()*2)<=1)
							attack();
		}
		public override function moveUp():void
		{
			super.moveUp();
			
			for(var i = 0;i<partsList.listSize();i++)
				partsList.getObject(i).moveUp();
			
			if(centerY>50 && centerY<250)
				if(shootTimer >= shootLimiter)
					if(Math.round(Math.random()*2)<=1)
						attack();
		}
		public override function moveDown():void
		{
			super.moveDown();
			
			for(var i = 0;i<partsList.listSize();i++)
				partsList.getObject(i).moveDown();
			
			if(centerY>50 && centerY<250)
				if(shootTimer >= shootLimiter)
					if(Math.round(Math.random()*2)<=1)
						attack();
		}
		public function setShootLimiter(n:Number):void
		{
			shootLimiter = n;
		}
		public function attack():void
		{
			shootTimer = 0;
			AudioManager.playAudio(AudioManager.getPaintapedeCrawlSound());
			shootLimiter = Math.round(Math.random()*2)+2;
			if(x>300)
			{
				if(Math.round(Math.random()*1) == 0)
				{
					var egg:GreenEgg = new GreenEgg(centerX,centerY);
					egg.addToParent(parent);
				}
				else
				{
					var egg2:BulletEgg = new BulletEgg(centerX,centerY);
					egg2.addToParent(parent);
				}
			}
			else
			{
				if(Math.round(Math.random()*1) == 0)
				{
					var egg3:PurpleEgg = new PurpleEgg(centerX,centerY);
					egg3.addToParent(parent);
				}
				else
				{
					var egg4:BulletEgg = new BulletEgg(centerX,centerY);
					egg4.addToParent(parent);
				}
			}
		}
		public function breakApart(breakingPoint:PaintapedeHead):void
		{
			AudioManager.playAudio(AudioManager.getPaintapedeInjuredSoundTwo());
			
			var index = partsList.indexOfObject(breakingPoint);
			var miniOne:Minipede;
			var miniTwo:Minipede;
			if(dir == 0 || dir == 1)
			{
				miniOne = new Minipede(x+10,y,1,host);
				miniTwo = new Minipede(x-10,y,0,host);
				miniOne.addToParent(parent);
				miniTwo.addToParent(parent);
			}
			else
			{
				miniOne = new Minipede(x,y+10,3,host);
				miniTwo = new Minipede(x,y-10,2,host);
				miniOne.addToParent(parent);
				miniTwo.addToParent(parent);
			}
			
			for(var i = 0;i<index;i++)
				partsList.getObject(i).setHost(miniOne);
			
			for(var i2 = index+1;i2<partsList.listSize();i2++)
				partsList.getObject(i2).setHost(miniTwo);
			
			if(dir == 0 || dir == 1)
			{
				miniOne.faceRight();
				miniTwo.faceLeft();
			}
			else
			{
				miniOne.faceDown();
				miniTwo.faceUp();
			}
	
			host.getMinipedeList().addObject(miniOne);
			host.getMinipedeList().addObject(miniTwo);
			
			miniOne.updateCenter();
			miniTwo.updateCenter();
	
			removeFromStage();
		}
		public override function checkCollision():void
		{
			
		}
		public override function attachFade():void
		{
			
		}
		public override function takeDamage(amount:Number,src:Entity = null):void
		{
			host.takeDamage(amount,src);
			AudioManager.playAudio(AudioManager.getPaintapedeInjuredSoundOne());
			super.takeDamage(amount,src);
		}
		public function faceRandomDirection():void
		{
			dir = Math.round(Math.random()*3);
			
			if(dir == 0)
				prepareLeftAttack();
			else if(dir == 1)
				prepareRightAttack();
			else if(dir == 2)
				prepareUpAttack();
			else if(dir == 3)
				prepareDownAttack();
			
			if(shootTimer<shootLimiter)
				shootTimer++;
		}
		public function prepareLeftAttack():void
		{
			x = 800;
			y = Math.random()*200+50;
			faceLeft();
			var a:AttackCautionAlert = new AttackCautionAlert(520,y);
			a.addToParent(GameManager.getTimeline());
		}
		public function prepareRightAttack():void
		{
			x = -200;
			y = Math.random()*200+50;
			faceRight();
			var a:AttackCautionAlert = new AttackCautionAlert(80,y);
			a.addToParent(GameManager.getTimeline());
		}
		public function prepareUpAttack():void
		{
			x = Math.random()*500+50;
			y = 500;
			faceUp();
			var a:AttackCautionAlert = new AttackCautionAlert(x,220);
			a.addToParent(GameManager.getTimeline());
		}
		public function prepareDownAttack():void
		{
			x = Math.random()*500+50;
			y = -200;
			faceDown();
			var a:AttackCautionAlert = new AttackCautionAlert(x,80);
			a.addToParent(GameManager.getTimeline());
		}
		public function faceLeft():void
		{
			var baseX:Number = 72.75;
			
			for(var i = 0;i<partsList.listSize();i++)
			{
				partsList.getObject(i).x = x-baseX;
				partsList.getObject(i).y = y;
				partsList.getObject(i).setOrigin(partsList.getObject(i).x,partsList.getObject(i).y);
				if(i == 0)
					baseX-=24.25;
				else if(i == 1)
					baseX-=25.5;
				else if(i == 2)
					baseX-=23;
				else if(i == 3)
					baseX-=21;
				else if(i == 4)
					baseX-=21;
				else if(i == 5)
					baseX-=17.3;
				else if(i == 6)
					baseX-=14.5;
			}
		}
		public function faceRight():void
		{
			var baseX:Number = 72.75;
			
			for(var i = 0;i<partsList.listSize();i++)
			{
				partsList.getObject(i).x = x+baseX;
				partsList.getObject(i).y = y;
				partsList.getObject(i).setOrigin(partsList.getObject(i).x,partsList.getObject(i).y);
				if(i == 0)
				baseX-=24.25;
				else if(i == 1)
				baseX-=25.5;
				else if(i == 2)
				baseX-=23;
				else if(i == 3)
				baseX-=21;
				else if(i == 4)
				baseX-=21;
				else if(i == 5)
				baseX-=17.3;
				else if(i == 6)
				baseX-=14.5;
			}
		}
		public function faceUp():void
		{
			var baseY:Number = 72.75;
			
			for(var i = 0;i<partsList.listSize();i++)
			{
				partsList.getObject(i).x = x;
				partsList.getObject(i).y = y-baseY;
				partsList.getObject(i).setOrigin(partsList.getObject(i).x,partsList.getObject(i).y);
				if(i == 0)
				baseY-=24.25;
				else if(i == 1)
				baseY-=25.5;
				else if(i == 2)
				baseY-=23;
				else if(i == 3)
				baseY-=21;
				else if(i == 4)
				baseY-=21;
				else if(i == 5)
				baseY-=17.3;
				else if(i == 6)
				baseY-=14.5;
			}
		}
		public function faceDown():void
		{
			var baseY:Number = 72.75;
			
			for(var i = 0;i<partsList.listSize();i++)
			{
				partsList.getObject(i).x = x;
				partsList.getObject(i).y = y+baseY;
				partsList.getObject(i).setOrigin(partsList.getObject(i).x,partsList.getObject(i).y);
				if(i == 0)
					baseY-=24.25;
				else if(i == 1)
					baseY-=25.5;
				else if(i == 2)
					baseY-=23;
				else if(i == 3)
					baseY-=21;
				else if(i == 4)
					baseY-=21;
				else if(i == 5)
					baseY-=17.3;
				else if(i == 6)
					baseY-=14.5;
			}
		}
		public override function removeFromStage():void
		{
			while(partsList.listSize()>0)
				partsList.removeObject(partsList.getObject(0));
				
			if(host.getMinipedeList()!=null)
				host.getMinipedeList().removeObject(this);
				
			host = null;
			partsList = null;
			super.removeFromStage();
		}
	}
}