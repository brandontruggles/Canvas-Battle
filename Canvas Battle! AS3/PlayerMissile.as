package 
{
	import flash.events.Event;
	import flash.geom.ColorTransform;
	import fl.motion.Color;
	import flash.display.MovieClip;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Matrix;

	public class PlayerMissile extends MultiDirectionalMissile
	{
		private var color:ColorTransform;
		private var dir:Number;
		
		public function PlayerMissile(ball:PlayerBall = null,d:Number = -1,c:Boolean = false)
		{
			super(ball,0,0,20,c);

			dir = d;
			if(!clone)
			{
				if(d == -1)
				{
					if((sourceEntity as PlayerBall).getDirection() == 0)
					{
						rotation = -90;
						yVelocity = -12;
						if((sourceEntity as PlayerBall).isUsingSplitShot())
						{
							var m1:PlayerMissile = new PlayerMissile((sourceEntity as PlayerBall),7);
							m1.addToParent(GameManager.getTimeline());
							var m2:PlayerMissile = new PlayerMissile((sourceEntity as PlayerBall),1);
							m2.addToParent(GameManager.getTimeline());
						}
					}
					else if((sourceEntity as PlayerBall).getDirection() == 1)
					{
						rotation = -45;
						xVelocity = 12;
						yVelocity = -12;
						
						if((sourceEntity as PlayerBall).isUsingSplitShot())
						{
							var m3:PlayerMissile = new PlayerMissile((sourceEntity as PlayerBall),0);
							m3.addToParent(GameManager.getTimeline());
							var m4:PlayerMissile = new PlayerMissile((sourceEntity as PlayerBall),2);
							m4.addToParent(GameManager.getTimeline());
						}
					}
					else if((sourceEntity as PlayerBall).getDirection() == 2)
					{
						xVelocity = 12;
						if((sourceEntity as PlayerBall).isUsingSplitShot())
						{
							var m5:PlayerMissile = new PlayerMissile((sourceEntity as PlayerBall),1);
							m5.addToParent(GameManager.getTimeline());
							var m6:PlayerMissile = new PlayerMissile((sourceEntity as PlayerBall),3);
							m6.addToParent(GameManager.getTimeline());
						}
					}
					else if((sourceEntity as PlayerBall).getDirection() == 3)
					{
						xVelocity = 12;
						yVelocity = 12;
						rotation = 45;
						
						if((sourceEntity as PlayerBall).isUsingSplitShot())
						{
							var m7:PlayerMissile = new PlayerMissile((sourceEntity as PlayerBall),2);
							m7.addToParent(GameManager.getTimeline());
							var m8:PlayerMissile = new PlayerMissile((sourceEntity as PlayerBall),4);
							m8.addToParent(GameManager.getTimeline());
						}
					}
					else if((sourceEntity as PlayerBall).getDirection() == 4)
					{
						yVelocity = 12;
						rotation = 90;
						
						if((sourceEntity as PlayerBall).isUsingSplitShot())
						{
							var m9:PlayerMissile = new PlayerMissile((sourceEntity as PlayerBall),3);
							m9.addToParent(GameManager.getTimeline());
							var m10:PlayerMissile = new PlayerMissile((sourceEntity as PlayerBall),5);
							m10.addToParent(GameManager.getTimeline());
						}
					}
					else if((sourceEntity as PlayerBall).getDirection() == 5)
					{
						xVelocity = -12;
						yVelocity = 12;
						rotation = 135;
						
						if((sourceEntity as PlayerBall).isUsingSplitShot())
						{
							var m11:PlayerMissile = new PlayerMissile((sourceEntity as PlayerBall),4);
							m11.addToParent(GameManager.getTimeline());
							var m12:PlayerMissile = new PlayerMissile((sourceEntity as PlayerBall),6);
							m12.addToParent(GameManager.getTimeline());
						}
					}
					else if((sourceEntity as PlayerBall).getDirection() == 6)
					{
						xVelocity = -12;
						rotation = 180;
						
						if((sourceEntity as PlayerBall).isUsingSplitShot())
						{
							var m13:PlayerMissile = new PlayerMissile((sourceEntity as PlayerBall),5);
							m13.addToParent(GameManager.getTimeline());
							var m14:PlayerMissile = new PlayerMissile((sourceEntity as PlayerBall),7);
							m14.addToParent(GameManager.getTimeline());
						}
					}
					else if((sourceEntity as PlayerBall).getDirection() == 7)
					{
						xVelocity = -12;
						yVelocity = -12;
						rotation = 225;
						if((sourceEntity as PlayerBall).isUsingSplitShot())
						{
							var m15:PlayerMissile = new PlayerMissile((sourceEntity as PlayerBall),6);
							m15.addToParent(GameManager.getTimeline());
							var m16:PlayerMissile = new PlayerMissile((sourceEntity as PlayerBall),0);
							m16.addToParent(GameManager.getTimeline());
						}
					}
				}
				else
				{
					if(d == 0)
					{
						rotation = -90;
						yVelocity = -12;
					}
					else if(d == 1)
					{
						rotation = -45;
						xVelocity = 12;
						yVelocity = -12;
					}
					else if(d == 2)
					{
						xVelocity = 12;
					}
					else if(d == 3)
					{
						xVelocity = 12;
						yVelocity = 12;
						rotation = 45;
					}
					else if(d == 4)
					{
						yVelocity = 12;
						rotation = 90;
					}
					else if(d == 5)
					{
						xVelocity = -12;
						yVelocity = 12;
						rotation = 135;
					}
					else if(d == 6)
					{
						xVelocity = -12;
						rotation = 180;
					}
					else if(d == 7)
					{
						xVelocity = -12;
						yVelocity = -12;
						rotation = 225;
					}
				}
			}
			hitRadius = 10;
			color = ball.getColor();
			fillWithColor(color);
		}
		public override function getClone():Entity
		{
			return new PlayerMissile((sourceEntity as PlayerBall),dir,true);
		}
		public function getColor():ColorTransform
		{
			return color;
		}
		public override function moveLeft():void
		{
			if((sourceEntity as PlayerBall).isSlowed())
				x-=xVelocity/2;
			else
				super.moveLeft();
		}
		public override function moveRight():void
		{
			if((sourceEntity as PlayerBall).isSlowed())
				x+=xVelocity/2;
			else
				super.moveRight();
		}
		public override function moveUp():void
		{
			if((sourceEntity as PlayerBall).isSlowed())
				y-=yVelocity/2;
			else
				super.moveUp();
		}
		public override function moveDown():void
		{
			if((sourceEntity as PlayerBall).isSlowed())
				y+=yVelocity/2;
			else
				super.moveDown();
		}
		public override function fillWithColor(c:ColorTransform):void
		{
			var mc:MovieClip = (getChildByName("anim") as MovieClip);
			mc.transform.colorTransform = c;
		}
		public override function processTimeSlow():void
		{
			if((sourceEntity as PlayerBall).isSlowed())
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
			var hitSomething:Boolean = false;
			
			for(var i = 0;i<GameManager.getEnemyList().listSize();i++)
			{
				var targetEntity:Entity = (GameManager.getEnemyList().getObject(i) as Entity);
				
				if(!(targetEntity is Paintapede) && !(targetEntity is PaintBrushBoss))
				{
					if(hittingEntity(targetEntity) && !((targetEntity as LivingEntity).isInvulnerable()))
					{
						(targetEntity as LivingEntity).takeDamage(damage,this);
						hitSomething = true;
						i = GameManager.getEnemyList().listSize();
					}
				}
				else
				{
					if(hitTestObject(targetEntity) && !((targetEntity as LivingEntity).isInvulnerable()))
					{
						if(!(targetEntity is PaintBrushBoss))
						{
						   (targetEntity as LivingEntity).takeDamage(damage,this);
							hitSomething = true;
							i = GameManager.getEnemyList().listSize();
						}
						else
						{
							if((targetEntity as LivingEntity).getHealth()>0)
							{
								if(targetEntity.currentFrame == 2)
								{
									var childAnim:MovieClip = (targetEntity.getChildAt(0) as MovieClip);
									
									if(childAnim.currentFrame<90)
									{
										hitSomething = true;
										i = GameManager.getEnemyList().listSize();
									}
								}
								else if(targetEntity.currentFrame == 4)
								{
									var childAnim2:MovieClip = (targetEntity.getChildAt(0) as MovieClip);
									
									if(childAnim2.currentFrame>30 && childAnim2.currentFrame<145)
									{
										(targetEntity as LivingEntity).takeDamage(damage,this);
										hitSomething = true;
										i = GameManager.getEnemyList().listSize();
									}
								}
							}
						}
					}
				}
			}
			for(var i2 = 0;i2<GameManager.getMiscList().listSize();i2++)
			{
				var targetMisc:Entity = (GameManager.getMiscList().getObject(i2) as Entity);
				
				if(!(targetMisc is PaintSwipe))
				{
					if(hittingEntity(targetMisc) && ((targetMisc is PinkMissile) || targetMisc is EggMissile || targetMisc is WaterBubble || targetMisc is ChaoticBomb || targetMisc is BrownMissile || targetMisc is GreenMissile || targetMisc is LightBlueMissile))
					{
						if(targetMisc is PinkMissile)
							(targetMisc as PinkMissile).explode();
						else if(targetMisc is GreenMissile)
							(targetMisc as GreenMissile).explode();
						else if(targetMisc is LightBlueMissile)
							(targetMisc as LightBlueMissile).explode();
						else if(targetMisc is EggMissile)
							(targetMisc as EggMissile).explode();
						else if(targetMisc is WaterBubble)
						{
							if(!((targetMisc as WaterBubble).isInvulnerable()))
								(targetMisc as WaterBubble).explode();
						}
						else if(targetMisc is ChaoticBomb)
							(targetMisc as ChaoticBomb).explode();
						else if(targetMisc is BrownMissile)
							(targetMisc as BrownMissile).explode();
							
						hitSomething = true;
							
						i2 = GameManager.getMiscList().listSize();
					}
				}
				else
				{
					if(hitTestObject(targetMisc))
					{
						hitSomething = true;
						i2 = GameManager.getMiscList().listSize();
					}
				}
			}
			
			if(hitSomething && sourceEntity!=null)
				explode();
				
		}
		public function explode():void
		{
			AudioManager.playAudio(AudioManager.getSplatterSoundOne());
			var explosion:PlayerMissileExplosion = new PlayerMissileExplosion(this);
			explosion.addToParent(GameManager.getTimeline());
			removeFromStage();
		}
		public override function removeFromStage():void
		{
			super.removeFromStage();
			color = null;
		}
	}
}
