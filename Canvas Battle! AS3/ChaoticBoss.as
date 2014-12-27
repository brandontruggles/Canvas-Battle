package  
{	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class ChaoticBoss extends Boss
	{
		private var attacking:Boolean;
		private var usingLeftChaoticAttack:Boolean;
		private var usingMiddleChaoticAttack:Boolean;
		private var usingRightChaoticAttack:Boolean;
		private var hitTop:Boolean;
		private var hitBottom:Boolean;
		private var hitLeft:Boolean;
		private var movingUpFirst:Boolean;
		private var movingDownFirst:Boolean;
		private var originalY:Number;
		private var centerTimer:Number;
		private var chaoticSpawnTimer:Number;
		
		public function ChaoticBoss(c:Boolean = false)
		{
			super(700,150,720,4,2,c);
			
			if(!clone)
			{
				AudioManager.stopAllAudio();
				AudioManager.loopAudio(AudioManager.getBossMusic());
				stoppingList.addObject(currentFrame);
				stoppingList.addObject(2);
				stoppingList.addObject(3);
				stoppingList.addObject(totalFrames);
				attacking = false;
				usingLeftChaoticAttack = false;
				usingMiddleChaoticAttack = false;
				usingRightChaoticAttack = false;
				hitLeft = false;
				hitTop = false;
				hitBottom = false;
				movingUpFirst = false;
				movingDownFirst = false;
				originalY = y;
				centerTimer = 0;
				chaoticSpawnTimer = 0;
				damage = 20;
				hitRadius = 66;
				stop();
			}
		}
		public override function getClone():Entity
		{
			return new ChaoticBoss(true);
		}
		public override function updateTimedVariables(evt:Event):void
		{
			super.updateTimedVariables(evt);
			
			if(!GameManager.gameIsPaused())
			{
				if(currentFrame == 1)
				{
					if(cautionAlert.parent == null)
						gotoAndStop(2);
				}
				else if(currentFrame == 2)
				{
					if(x>500)
						moveLeft();
					else
					{
						gotoAndStop(3);
						playingIntro = false;
					}
				}
				else
				{
					if(!attacking && y == originalY && x == 500)
					{
						attack();
						if(currentFrame!=2)
							gotoAndStop(2);
					}
					else if (!attacking && y<originalY)
					{
						moveDown();
					}
					else if (!attacking && y>originalY)
					{
						moveUp();
					}
					else if(!attacking && x<500)
					{
						if(currentFrame!=4)
							gotoAndStop(4);
							
						moveRight();
					}
					else if(attacking)
					{
						if(usingLeftChaoticAttack)
						{
							if(hitLeft)
							{
								if(currentFrame!=3)
									gotoAndStop(3);
								if(chaoticSpawnTimer<45/GameManager.getDifficulty())
									chaoticSpawnTimer++;
								else
								{
									chaoticSpawnTimer = 0;
									AudioManager.playAudio(AudioManager.getChaoticGrowlSound());
									var ball:ChaoticBall = new ChaoticBall(x,y,0,-1,ChaoticBall.SIZE_LARGE());
									ball.addToParent(GameManager.getTimeline());
								}
								if(movingDownFirst)
								{
									if(!(hitBottom && hitTop))
									{
										if(y<250 && !hitBottom)
											moveDown();
										else if(y>=250 && !hitBottom)
											hitBottom = true;
										
										if(y>50 && hitBottom)
											moveUp();
										else if(y<=50 && hitBottom)
											hitTop = true;
									}
									else
									{
										attacking = false;
										hitLeft = false;
										hitBottom = false;
										hitTop = false;
										movingDownFirst = false;
									}
								}
								else
								{
									if(!(hitBottom && hitTop))
									{
										if(y>50 && !hitTop)
											moveUp();
										else if(y>=50 && !hitTop)
											hitTop = true;
										
										if(y<250 && hitTop)
											moveDown();
										else if(y>=250 && hitTop)
											hitBottom = true;
									}
									else
									{
										attacking = false;
										usingLeftChaoticAttack = false;
										hitLeft = false;
										hitBottom = false;
										hitTop = false;
										movingUpFirst = false;
									}
								}
							}
							else
							{
								if(x>50 && !hitLeft)
									moveLeft();
								else if(x<=50 && !hitLeft)
									hitLeft = true;
								if(currentFrame!=4)
									gotoAndStop(4);
							}
						}
						else if(usingRightChaoticAttack)
						{
							if(chaoticSpawnTimer<45/GameManager.getDifficulty())
								chaoticSpawnTimer++;
							else
							{
								chaoticSpawnTimer = 0;
								AudioManager.playAudio(AudioManager.getChaoticGrowlSound());
								var ball2:ChaoticBall = new ChaoticBall(x,y,1,-1,ChaoticBall.SIZE_LARGE());
								ball2.addToParent(GameManager.getTimeline());
							}
							if(movingDownFirst)
							{
								if(!(hitBottom && hitTop))
								{
									if(y<250 && !hitBottom)
										moveDown();
									else if(y>=250 && !hitBottom)
										hitBottom = true;
									
									if(y>50 && hitBottom)
										moveUp();
									else if(y<=50 && hitBottom)
										hitTop = true;
								}
								else
								{
									attacking = false;
									usingRightChaoticAttack = false;
									hitLeft = false;
									hitBottom = false;
									hitTop = false;
									movingDownFirst = false;
								}
							}
							else
							{
								if(!(hitBottom && hitTop))
								{
									if(y>50 && !hitTop)
										moveUp();
									else if(y>=50 && !hitTop)
										hitTop = true;
									
									if(y<250 && hitTop)
										moveDown();
									else if(y>=250 && hitTop)
										hitBottom = true;
								}
								else
								{
									attacking = false;
									hitLeft = false;
									hitBottom = false;
									hitTop = false;
									movingUpFirst = false;
								}
							}
						}
						else if(usingMiddleChaoticAttack)
						{
							if(x>300)
							{
								moveLeft();
								if(currentFrame!=4)
									gotoAndStop(4);
							}
							else
							{
								if(currentFrame!=3)
									gotoAndStop(3);
								if(centerTimer<120)
								{
									if(chaoticSpawnTimer<90/GameManager.getDifficulty())
										chaoticSpawnTimer++;
									else
									{
										AudioManager.playAudio(AudioManager.getChaoticGrowlSound());
										chaoticSpawnTimer = 0;
										var b1:ChaoticBall = new ChaoticBall(x,y,-1,0,ChaoticBall.SIZE_LARGE());
										b1.addToParent(GameManager.getTimeline());
										var b2:ChaoticBall = new ChaoticBall(x,y,1,0,ChaoticBall.SIZE_LARGE());
										b2.addToParent(GameManager.getTimeline());
										var b3:ChaoticBall = new ChaoticBall(x,y,1,1,ChaoticBall.SIZE_LARGE());
										b3.addToParent(GameManager.getTimeline());
										var b4:ChaoticBall = new ChaoticBall(x,y,-1,1,ChaoticBall.SIZE_LARGE());
										b4.addToParent(GameManager.getTimeline());
										var b5:ChaoticBall = new ChaoticBall(x,y,0,1,ChaoticBall.SIZE_LARGE());
										b5.addToParent(GameManager.getTimeline());
										var b6:ChaoticBall = new ChaoticBall(x,y,0,-1,ChaoticBall.SIZE_LARGE());
										b6.addToParent(GameManager.getTimeline());
										var b7:ChaoticBall = new ChaoticBall(x,y,1,-1,ChaoticBall.SIZE_LARGE());
										b7.addToParent(GameManager.getTimeline());
										var b8:ChaoticBall = new ChaoticBall(x,y,0,0,ChaoticBall.SIZE_LARGE());
										b8.addToParent(GameManager.getTimeline());
									}
									centerTimer++;
								}
								else
								{
									centerTimer = 0;
									usingMiddleChaoticAttack = false;
									attacking = false;
								}
							}
						}
					}
				}
			}
		}
		public function attack():void
		{
			attacking = true;
			var attackRand:Number = Math.round(Math.random())*2;
			if(attackRand == 0)
			{
				useLeftChaoticAttack();
			}
			else if(attackRand == 1)
			{
				useRightChaoticAttack();
			}
			else if(attackRand == 2)
			{
				useMiddleChaoticAttack();
			}
		}
		public function useLeftChaoticAttack():void
		{
			usingLeftChaoticAttack = true;
			var dirRand:Number = Math.round(Math.random());
			if(dirRand == 0)
				movingUpFirst = true;
			else
				movingDownFirst = true;
		}
		public function useRightChaoticAttack():void
		{
			usingRightChaoticAttack = true;
			var dirRand:Number = Math.round(Math.random());
			if(dirRand == 0)
				movingUpFirst = true;
			else
				movingDownFirst = true;
		}
		public function useMiddleChaoticAttack():void
		{
			usingMiddleChaoticAttack = true;
		}
		public function explode():void
		{
			var explosion:ChaoticBossExplosion = new ChaoticBossExplosion(this);
			explosion.addToParent(GameManager.getTimeline());
			var s:ShieldPowerUp = new ShieldPowerUp(x,y);
			s.addToParent(GameManager.getTimeline());
		}
		public override function die():void
		{
			explode();
			AudioManager.stopAllAudio();
			if(!CanvasManager.twelfthCanvasIsUnlocked())
			{
				var c:Canvas = new Canvas(700,150,12);
				c.addToParent(GameManager.getTimeline());
			}
			
			APIManager.submitChaoticBossKilled();
			
			super.die();
		}
	}
}