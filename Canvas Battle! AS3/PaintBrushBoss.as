package 
{
	import flash.events.Event;
	import flash.display.MovieClip;
	
	public class PaintBrushBoss extends Boss
	{
		private var attacking:Boolean;
		private var usingGreenBallAttack:Boolean;
		private var usingSwipeAttack:Boolean;
		private var firedIntroShots:Boolean;
		private var swipedUp:Boolean;
		private var greenBallTimer:Number;
		private var attackRand:Number;
		private var swipeMax:Number;
		private var swipeCounter:Number;
		private var swipeTimer:Number;
		private var neutralTimer:Number;
		private var limitTimer:Number;
		private var introShotOne:SolidPaintSwipe;
		private var introShotTwo:JaggedPaintSwipe;
		
		public function PaintBrushBoss(c:Boolean = false)
		{
			super(300,120,360,4,4,c);
			
			if(!clone)
			{
				AudioManager.stopAllAudio();
				AudioManager.loopAudio(AudioManager.getBossMusic());
				stoppingList.addObject(currentFrame);
				stoppingList.addObject(2);
				stoppingList.addObject(3);
				stoppingList.addObject(4);
				stoppingList.addObject(totalFrames);
				attacking = false;
				firedIntroShots = false;
				swipedUp = false;
				attackRand = 0;
				greenBallTimer = Math.round(Math.random()*9)/GameManager.getDifficulty();
				swipeTimer = 90;
				swipeCounter = 0;
				swipeMax = 0;
				neutralTimer = 0;
				limitTimer = 0;
				pointValue = 1000;
				damage = 20;
				stop();
			}
		}
		public override function getClone():Entity
		{
			return new PaintBrushBoss(true);
		}
		public override function updateTimedVariables(evt:Event):void
		{
			super.updateTimedVariables(evt);
			
			if (!GameManager.gameIsPaused())
			{
				if(currentFrame == 1)
				{
					if(cautionAlert.parent == null && !firedIntroShots)
					{
						introShotOne = new SolidPaintSwipe(this);
						introShotOne.x = 700;
						introShotOne.y = 50;
						
						introShotTwo = new JaggedPaintSwipe(this);
						introShotTwo.x = 900;
						introShotTwo.y = 250;
						
						AudioManager.playAudio(AudioManager.getPaintSwipeSound());
						
						introShotOne.addToParent(GameManager.getTimeline());
						introShotTwo.addToParent(GameManager.getTimeline());
						
						firedIntroShots = true;
					}
					else if(cautionAlert.parent == null && introShotOne.parent == null && introShotTwo.parent == null)
					{
						gotoAndStop(2);
					}
				}
				else if(currentFrame == 2)
				{
					if((getChildAt(0) as MovieClip).currentFrame == (getChildAt(0) as MovieClip).totalFrames)
					{
						gotoAndStop(3);
						playingIntro = false;
					}
				}
				else if(currentFrame == 3)
				{
					if(!attacking)
					{
						if(health>0)
						{
							if(neutralTimer<60)
								neutralTimer++;
							else
							{
								attack();
								neutralTimer = 0;
							}
						}
						else
							gotoAndStop(5);
					}
					else
					{
						if(usingSwipeAttack)
						{
							if(x<800)
								moveRight();
							else
							{
								if(swipeCounter<swipeMax)
								{
									if(swipeTimer<60/GameManager.getDifficulty())
										swipeTimer++;
									else
									{
										if(Math.round(Math.random()) == 0)
										{
											var s1:SolidPaintSwipe = new SolidPaintSwipe(this);
											
											if(!swipedUp)
											{
												s1.x = 700;
												s1.y = 50;
											}
											else
											{
												s1.x = 700;
												s1.y = 250;
											}
											
											s1.addToParent(GameManager.getTimeline());
										}
										else
										{
											var s2:JaggedPaintSwipe = new JaggedPaintSwipe(this);
											
											if(!swipedUp)
											{
												s2.x = 700;
												s2.y = 50;
											}
											else
											{
												s2.x = 700;
												s2.y = 250;
											}
											s2.addToParent(GameManager.getTimeline());
										}
										
										AudioManager.playAudio(AudioManager.getPaintSwipeSound());
										
										swipeTimer = 0;
										
										if(swipedUp)
											swipedUp = false;
										else
											swipedUp = true;
											
										swipeCounter++;
									}
								}
								else
								{
									swipeCounter = 0;
									swipeTimer = 90;
									usingSwipeAttack = false;
									
									if(Math.round(Math.random()) == 0)
										swipedUp = true;
									else
										swipedUp = false;
								}
							}
						}
						else
						{
							if(x>300)
								moveLeft();
							else
								attacking = false;
						}
					}
				}
				else if(currentFrame == 4)
				{
					if((getChildAt(0) as MovieClip).currentFrame != (getChildAt(0) as MovieClip).totalFrames)
					{
						if(usingGreenBallAttack)
						{
							if((getChildAt(0) as MovieClip).currentFrame>30 && (getChildAt(0) as MovieClip).currentFrame<145)
							{
								if(greenBallTimer<9/GameManager.getDifficulty())
									greenBallTimer++;
								else
								{
										var tip:MovieClip = ((getChildAt(0) as MovieClip).getChildByName("brushTip") as MovieClip);
										
										if(tip.y+(getChildAt(0) as MovieClip).y+y<300 && health>0)
										{
											var g:GreenBall = new GreenBall();
											g.x = tip.x+(getChildAt(0) as MovieClip).x+x;
											g.y = tip.y+(getChildAt(0) as MovieClip).y+y;
											g.addToParent(GameManager.getTimeline());
										}
										
										greenBallTimer = 0;
								}
							}
						}
					}
					else
					{
						if(usingGreenBallAttack)
						{
							usingGreenBallAttack = false;
							greenBallTimer = Math.round(Math.random()*9)/GameManager.getDifficulty();
						}
							
						attacking = false;
						gotoAndStop(3);
					}
				}
				else if(currentFrame == 5)
				{
					if((getChildAt(0) as MovieClip).currentFrame == (getChildAt(0) as MovieClip).totalFrames)
						explode();
				}
			}
		}

		public function attack():void
		{
			attackRand = Math.round(Math.random());
			
			attacking = true;
			
			if (attackRand == 0)
			{
				useGreenBallAttack();
				limitTimer = 0;
			}
			else if (attackRand == 1)
			{
				if(limitTimer<3)
				{
					useSwipeAttack();
					limitTimer++;
				}
				else
				{
					useGreenBallAttack();
					limitTimer = 0;
				}
			}
		}
		public function useGreenBallAttack():void
		{
			gotoAndStop(4);
			usingGreenBallAttack = true;
		}
		public function useSwipeAttack():void
		{
			swipeMax = Math.round(Math.random()*3)+4;
			usingSwipeAttack = true;
		}
		public function explode():void
		{
			var explosion:PaintBrushBossExplosion = new PaintBrushBossExplosion(this);
			explosion.addToParent(GameManager.getTimeline());
			removeFromStage();
		}
		public override function die():void
		{
			AudioManager.stopAllAudio();
			if(!CanvasManager.fifteenthCanvasIsUnlocked())
			{
				var c:Canvas = new Canvas(700,150,15);
				c.addToParent(GameManager.getTimeline());
			}
			
			APIManager.submitPaintBrushBossKilled();
		}
		public override function removeFromStage():void
		{
			introShotOne = null;
			introShotTwo = null;
			super.removeFromStage();
		}
	}
}