package 
{
	import flash.events.Event;
	import flash.display.MovieClip;
	
	public class WaterBoss extends Boss
	{
		private var bubbleTimer:Number;
		private var attackTimer:Number;
		private var chargeTimer:Number;
		private var attackRand:Number;
		private var originalY:Number;
		private var waveX:Number;
		private var resizeCounter:Number;
		private var attacking:Boolean;
		private var resizing:Boolean;
		private var shrinking:Boolean;
		private var usingAttack:Boolean;
		private var usingHorizontalBubblebeam:Boolean;
		private var usingVerticalBubblebeam:Boolean;
		private var usingResizeAttack:Boolean;
		private var hitLeft:Boolean;
		private var hitMaxSize:Boolean;
		private var attackTarget:PlayerBall;
		
		public function WaterBoss(c:Boolean = false)
		{
			super(500,160,720,2,2,c);
			
			if(!clone)
			{
				AudioManager.stopAllAudio();
				AudioManager.loopAudio(AudioManager.getBossMusic());
				originalY = y;
				damage = 20;
				pointValue = 1000;
				waveX = x-width/2-40-Math.random()*40;
				attackTimer = 0;
				bubbleTimer = 0;
				chargeTimer = 0;
				resizeCounter = 0;
				attacking = false;
				usingAttack = false;
				resizing = false;
				usingResizeAttack = false;
				hitLeft = false;
				shrinking = false;
				hitMaxSize = false;
				hitRadius = width/2;
				usingHorizontalBubblebeam = false;
				usingVerticalBubblebeam = false;
				attackRand = Math.round(Math.random());
				stoppingList.addObject(currentFrame);
				stoppingList.addObject(2);
				stoppingList.addObject(totalFrames);
				var playerSelector:Number = Math.round(Math.random()*(GameManager.getPlayerList().listSize()-1));
				attackTarget = (GameManager.getPlayerList().getObject(playerSelector) as PlayerBall);
				stop();
			}
		}
		public override function getClone():Entity
		{
			return new WaterBoss(true);
		}
		public override function updateTimedVariables(evt:Event):void
		{
			super.updateTimedVariables(evt);
			if (!GameManager.gameIsPaused())
			{
				hitRadius = width/2;
				if(currentFrame == 1)
				{
					if(cautionAlert.parent == null)
						gotoAndStop(2);
				}
				else if (currentFrame == 2)
				{
					if (((MovieClip)(getChildAt(0))).currentFrame>30 && ((MovieClip)(getChildAt(0))).currentFrame<160)
					{
						if (bubbleTimer<5)
						{
							bubbleTimer++;
						}
						else
						{
							bubbleTimer = 0;
							var b:WaterBubble = new WaterBubble(this,255,-100,10,10);
							b.addToParent(GameManager.getTimeline());
							var b2:WaterBubble = new WaterBubble(this,275,400,10,-10);
							b2.addToParent(GameManager.getTimeline());
							var b3:WaterBubble = new WaterBubble(this,700,-60,-10,10);
							b3.addToParent(GameManager.getTimeline());
							var b4:WaterBubble = new WaterBubble(this,700,380,-10,-10);
							b4.addToParent(GameManager.getTimeline());
							AudioManager.playAudio(AudioManager.getWaterAttackSound());
						}
					}
					else if (((MovieClip)(getChildAt(0))).currentFrame == ((MovieClip)(getChildAt(0))).totalFrames)
					{
						gotoAndStop(3);
						bubbleTimer = 0;
						playingIntro = false;
					}
				}
				else if (currentFrame == 3)
				{
					if(resizing)
					{
						if(!hitMaxSize)
						{
							if(resizeCounter<24)
							{
								width+=8;
								height+=4;
								resizeCounter++;
							}
							else
							{
								hitMaxSize = true;
							}
						}
						else
						{
							if(resizeCounter>0)
							{
								width-=8;
								height-=4;
								resizeCounter--;
							}
							else
							{
								hitMaxSize = false;
							}
						}
					}
					if(shrinking)
					{
						if(width>99)
							width--;
						if(height>94)
							height--;
						if(width<=99 && height<=94)
						{
							shrinking = false;
							performActualDeath();
						}
					}
					if (!attacking && y == originalY && resizeCounter == 0)
					{
						attack();
					}
					else if (!attacking && y<originalY)
					{
						moveDown();
					}
					else if (!attacking && y>originalY)
					{
						moveUp();
					}
					else if(!attacking && resizeCounter>0)
					{
						width-=8;
						height-=4;
						resizeCounter--;
					}
					else if (attacking && attackTarget != null)
					{
						if (usingHorizontalBubblebeam)
						{
							if (y<attackTarget.y-10 && !usingAttack)
							{
								moveDown();
							}
							else if (y>attackTarget.y+10 && !usingAttack)
							{
								moveUp();
							}
							else if (!usingAttack)
							{
								usingAttack = true;
							}
							
							if(usingAttack)
							{
								if(attackTimer<90/GameManager.getDifficulty())
								{
									if(bubbleTimer<9/GameManager.getDifficulty())
										bubbleTimer++;
									else
									{
										var b5:WaterBubble = new WaterBubble(this,x-40,y,-10,0);
										b5.addToParent(GameManager.getTimeline());
										bubbleTimer = 0;
										AudioManager.playAudio(AudioManager.getWaterAttackSound());
									}
									attackTimer++;
								}
								else
								{
									attackTimer = 0;
									bubbleTimer = 0;
									usingAttack = false;
									usingHorizontalBubblebeam = false;
									attacking = false;
								}
							}
						}
						else if(usingVerticalBubblebeam)
						{
							if(!usingAttack)
							{
								if(chargeTimer<60/GameManager.getDifficulty())
								{
									chargeTimer++;
									if(bubbleTimer<6/GameManager.getDifficulty())
										bubbleTimer++;
									else
									{
										var b6:WaterBubble = new WaterBubble(this,x,y+height/2,0,10);
										b6.addToParent(GameManager.getTimeline());
										var b7:WaterBubble = new WaterBubble(this,x,y-height/2,0,-10);
										b7.addToParent(GameManager.getTimeline());
										
										bubbleTimer = 0;
										AudioManager.playAudio(AudioManager.getWaterAttackSound());
									}
								}
								else
								{
									var a1:AttackCautionAlert = new AttackCautionAlert(waveX,80);
									a1.addToParent(GameManager.getTimeline());
									var a2:AttackCautionAlert = new AttackCautionAlert(waveX,220);
									a2.addToParent(GameManager.getTimeline());
									
									usingAttack = true;
									chargeTimer = 0;
									bubbleTimer = 0;
								}
							}
							else
							{
								if(waveX>120)
								{
									if(chargeTimer<60/GameManager.getDifficulty())
									{
										chargeTimer++;
										if(bubbleTimer<6/GameManager.getDifficulty())
											bubbleTimer++;
										else
										{
											var b8:WaterBubble = new WaterBubble(this,waveX,-100,0,10);
											b8.addToParent(GameManager.getTimeline());
											var b9:WaterBubble = new WaterBubble(this,waveX,400,0,-10);
											b9.addToParent(GameManager.getTimeline());
											
											bubbleTimer = 0;
										}
									}
									else
									{
										waveX-=100+Math.random()*50;
										
										var a3:AttackCautionAlert = new AttackCautionAlert(waveX,80);
										a3.addToParent(GameManager.getTimeline());
										var a4:AttackCautionAlert = new AttackCautionAlert(waveX,220);
										a4.addToParent(GameManager.getTimeline());
										
										
										chargeTimer = 0;
										bubbleTimer = 0;
									}
								}
								else
								{
									waveX = x-width/2-40-Math.random()*40;
										
									usingVerticalBubblebeam = false;
									usingAttack = false;
									attacking = false;
								}
							}
						}
						else if(usingResizeAttack)
						{
							resizing = true;
							if(!hitLeft && x>50)
								moveLeft();
							else if(!hitLeft && x<=50)
								hitLeft = true;
							
							if(hitLeft && x<500)
								moveRight();
							else if(hitLeft && x>=500)
							{
								usingAttack = false;
								usingResizeAttack = false;
								resizing = false;
								hitMaxSize = false;
								hitLeft = false;
								attacking = false;
							}
						}
					}
					else if(attacking && attackTarget == null)
					{
						chargeTimer = 0;
						bubbleTimer = 0;
						waveX = x-width/2-40-Math.random()*40;
						attacking = false;
						usingAttack = false;
						usingHorizontalBubblebeam = false;
						usingVerticalBubblebeam = false;
						usingResizeAttack = false;
					}
				}
			}
		}

		public function attack():void
		{
			attackRand = Math.round(Math.random()*2);
			var playerSelector:Number = Math.round(Math.random()*(GameManager.getPlayerList().listSize()-1));
			attackTarget = (GameManager.getPlayerList().getObject(playerSelector) as PlayerBall);
			attacking = true;
			if (attackRand == 0)
			{
				useHorizontalBubblebeam();
			}
			else if (attackRand == 1)
			{
				useVerticalBubblebeam();
			}
			else if(attackRand == 2)
			{
				useResizeAttack();
			}
		}
		public function useHorizontalBubblebeam():void
		{
			usingHorizontalBubblebeam = true;
		}
		public function useVerticalBubblebeam():void
		{
			usingVerticalBubblebeam = true;
		}
		public function useResizeAttack():void
		{
			usingResizeAttack = true;
		}
		public function shrink():void
		{
			invulnerable = true;
			shrinking = true;
		}
		public function explode():void
		{
			var explosion:WaterBossExplosion = new WaterBossExplosion(this);
			explosion.addToParent(GameManager.getTimeline());
		}
		public override function die():void
		{
			shrink();
		}
		public function performActualDeath():void
		{
			explode();
			AudioManager.stopAllAudio();
			AudioManager.playAudio(AudioManager.getWaterBossDeathSound());
			
			if(!CanvasManager.thirteenthCanvasIsUnlocked())
			{
				var c:Canvas = new Canvas(700,150,13);
				c.addToParent(GameManager.getTimeline());
			}
			
			APIManager.submitWaterBossKilled();
			
			super.die();
		}
		public override function removeFromStage():void
		{
			attackTarget = null;
			super.removeFromStage();
		}
	}
}