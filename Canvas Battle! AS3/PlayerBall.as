package 
{
	import flash.events.Event;
	import flash.geom.ColorTransform;
	import flash.display.MovieClip;
	import flash.display.DisplayObject;
	import flash.system.System;

	public class PlayerBall extends Player
	{
		private var shootLimiter:Number;
		private var shootLimit:Number;
		private var combo:Number;
		private var visibilityTimer:Number;
		private var slowedTimer:Number;
		private var invulnerabilityTimer:Number;
		private var comboMeter:Number;
		private var invulnerabilityDuration:Number;
		private var fastShotTimer:Number;
		private var splitShotTimer:Number;
		private var imageTimer:Number;
		private var changedDir:Boolean;
		private var flashing:Boolean;
		private var slowed:Boolean;
		private var usingSplitShot:Boolean;
		private var pivoting:Boolean;
		private var shielding:Boolean;
		private var healthbar:PlayerHealthBar;
		private var comboBucket:ComboBucket;
		private var playerArrow:PlayerArrow;
		private var playerShield:PlayerShield;
		private var color:ColorTransform;
		private var dir:Number;
		
		public function PlayerBall(xpos:Number,ypos:Number,cl:Boolean = false,id:Number = 1)
		{
			super(xpos,ypos,100,cl);
			
			xVelocity = 8;
			yVelocity = 8;
			shootLimiter = 20;
			shootLimit = 20;
			visibilityTimer = 0;
			slowedTimer = 0;
			invulnerabilityTimer = 0;
			comboMeter = 0;
			invulnerabilityDuration = 60;
			fastShotTimer = 0;
			splitShotTimer = 0;
			imageTimer = 0;
			damage = 20;
			changedDir = false;
			flashing = true;
			
			if(clone)
				ID = id;
				
			if(ID == 1)
				color = GameManager.getP1Color();
			else
				color = GameManager.getP2Color();
					
			usingSplitShot = false;
			slowed = false;
			pivoting = false;
			shielding = false;
			invulnerable = true;
			combo = 1;
			dir = 2;
			hitRadius = 12.5;
			
			fillWithColor(color);
			
			if(!clone)
			{
				if(ID == 1)
					healthbar = new PlayerHealthBar(60,25,this);
				else
					healthbar = new PlayerHealthBar(440,25,this);
					
				playerArrow = new PlayerArrow(this);
				playerShield = new PlayerShield(this);
				
				if(ID == 1)
					comboBucket = new ComboBucket(healthbar.x-30,healthbar.y+1,this);
				else
					comboBucket = new ComboBucket(healthbar.x+130,healthbar.y+1,this);
					
				stoppingList.addObject(currentFrame);
				stoppingList.addObject(totalFrames);
				
				stop();
			}
		}
		public function getCombo():Number
		{
			return combo;
		}
		public function isFlashing():Boolean
		{
			return flashing;
		}
		public function isUsingSplitShot():Boolean
		{
			return usingSplitShot;
		}
		public function getColor():ColorTransform
		{
			return color;
		}
		public function getDirection():Number
		{
			return dir;
		}
		public function isSlowed():Boolean
		{
			return slowed;
		}
		public function isPivoting():Boolean
		{
			return pivoting;
		}
		public function isShielding():Boolean
		{
			return shielding;
		}
		public function getShield():PlayerShield
		{
			return playerShield;
		}
		public override function getClone():Entity
		{
			return new PlayerBall(x,y,true,ID);
		}
		public function setShielding(b:Boolean):void
		{
			shielding = b;
		}
		public function setColor(c:ColorTransform):void
		{
			color = c;
			fillWithColor(color);
			comboBucket.fillWithColor(color);
			playerArrow.fillWithColor(color);
			playerShield.fillWithColor(color);
			healthbar.setColor(color);
		}
		public override function fillWithColor(c:ColorTransform):void
		{
			for(var i = 0;i<numChildren;i++)
			{
				var c1 = getChildAt(i);
				
				if(c1 is MovieClip)
				{
					for(var i2 = 0;i2<(c1 as MovieClip).numChildren;i2++)
					{
						var c2 = (c1 as MovieClip).getChildAt(i2);
						
						if(c2 is MovieClip)
							if((c2 as MovieClip).name == "body")
								(c2 as MovieClip).transform.colorTransform = c;
					}
				}
			}
		}
		public function increaseCombo():void
		{
			if(combo<4)
			{
				if(comboMeter<5)
					comboMeter++;
				else
				{
					combo++;
					comboMeter = 0;
				}
				comboBucket.updateSelf();
			}
		}
		public function shoot():void
		{
			if(shootLimiter >= shootLimit)
			{
				var missile:PlayerMissile = new PlayerMissile(this);
				missile.addToParent(parent);
				shootLimiter = 0;
				AudioManager.playAudio(AudioManager.getPlayerFireSound());
			}
		}
		public function shield():void
		{
			if(playerShield.getHealth()>0)
			{
				shielding = true;
				playerShield.extend();
			}
			pivoting = true;
		}
		public function removeShield():void
		{
			shielding = false;
			pivoting = false;
			playerShield.contract();
			if(GameManager.getGameMode() == 0 && TutorialManager.getMessageIndex() == 17)
				TutorialManager.changeMessages();
		}
		public override function updateTimedVariables(evt:Event):void
		{
			if(!GameManager.gameIsPaused())
			{
				if(flashing)
				{
					if(visibilityTimer<3)
						visibilityTimer++;
					else
					{
						if(visible)
						{
							visible = false;
							playerShield.visible = false;
						}
						else
						{
							visible = true;
							if(shielding)
								playerShield.visible = true;
						}
						visibilityTimer = 0;
					}
				}
				if(slowed)
				{
					if(slowedTimer<180)
						slowedTimer++;
					else
					{
						slowed = false;
						shootLimit = 20;
					}
					if(imageTimer<5)
						imageTimer++;
					else
					{
						imageTimer = 0;
						var fade:EntityFade = new EntityFade(this);
						fade.addToParent(GameManager.getTimeline());
					}
				}
				
				if(shootLimiter<shootLimit)
					shootLimiter++;
				
				if(fastShotTimer>0)
				{
					fastShotTimer--;
				}
				else
				{
					if(shootLimit<20)
						shootLimit = 20;
				}
				if(splitShotTimer>0)
				{
					splitShotTimer--;
				}
				else
				{
					if(usingSplitShot)
						usingSplitShot = false;
				}
				
				if(invulnerable)
				{
					if(invulnerabilityTimer<invulnerabilityDuration)
						invulnerabilityTimer++;
					else
					{
						flashing = false;
						visible = true;
						if(shielding)
							playerShield.visible = true;
						else
							playerShield.visible = false;
						invulnerabilityTimer = 0;
						invulnerable = false;
					}
				}
				checkCollision();
			}
		}
		public override function checkCollision():void
		{
			for(var i = 0;i<GameManager.getEnemyList().listSize();i++)
			{
				var targetEntity:Entity = (GameManager.getEnemyList().getObject(i) as Entity);
				
				if(!(targetEntity is Paintapede) && !(targetEntity is PaintBrushBoss))
				{
					if((hittingEntity((targetEntity as LivingEntity)) || (shielding && playerShield.hittingEntity(targetEntity as LivingEntity))) && !((targetEntity as LivingEntity) is Target) && !((targetEntity as LivingEntity).isInvulnerable()) && !invulnerable)
					{
						var dmg:Number = (targetEntity as LivingEntity).getDamage();
						if(GameManager.getEnemyList().listSize()>0)
							(targetEntity as LivingEntity).takeDamage(damage);
						if(!shielding)
							takeDamage(dmg);
						else
							playerShield.takeDamage(dmg);
					}
				}
				else
				{
					if((hitTestObject((targetEntity as LivingEntity)) || (shielding && playerShield.hitTestObject(targetEntity as LivingEntity))) && !((targetEntity as LivingEntity) is Target) && !((targetEntity as LivingEntity).isInvulnerable()) && !invulnerable)
					{
						if(!targetEntity is PaintBrushBoss)
						{
							var dmg2:Number = (targetEntity as LivingEntity).getDamage();
							if(GameManager.getEnemyList().listSize()>0)
								(targetEntity as LivingEntity).takeDamage(damage);
							if(!shielding)
								takeDamage(dmg2);
							else
								playerShield.takeDamage(dmg2);
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
										var dmg3:Number = (targetEntity as LivingEntity).getDamage();
										if(GameManager.getEnemyList().listSize()>0)
											(targetEntity as LivingEntity).takeDamage(damage);
										if(!shielding)
											takeDamage(dmg3);
										else
											playerShield.takeDamage(dmg3);
									}
								}
								else if(targetEntity.currentFrame == 4)
								{
									var childAnim2:MovieClip = (targetEntity.getChildAt(0) as MovieClip);
									
									if(childAnim2.currentFrame>30 && childAnim2.currentFrame<145)
									{
										var dmg4:Number = (targetEntity as LivingEntity).getDamage();
										if(GameManager.getEnemyList().listSize()>0)
											(targetEntity as LivingEntity).takeDamage(damage);
										if(!shielding)
											takeDamage(dmg4);
										else
											playerShield.takeDamage(dmg4);
									}
								}
							}
						}
					}
				}
			}
		}
		public override function updateHealth(amount:Number):void
		{
			healthbar.updateSize(amount);
			
			if(health+amount<=40 && !healthbar.isFlashing())
				healthbar.startFlashing();
			else if(health+amount>40 && healthbar.isFlashing())
				healthbar.stopFlashing();
			super.updateHealth(amount);
		}
		public override function takeDamage(amount:Number,src:Entity = null):void
		{
			visible = false;
			invulnerable = true;
			flashing = true;
			combo = 1;
			comboMeter = 0;
			comboBucket.resetSelf();
			super.takeDamage(amount,src);
		}
		public override function moveLeft():void
		{
			if(slowed)
				x-=xVelocity/2;
			else
				super.moveLeft();
		}
		public override function moveRight():void
		{
			if(slowed)
				x+=xVelocity/2;
			else
				super.moveRight();
		}
		public override function moveUp():void
		{
			if(slowed)
				y-=yVelocity/2;
			else
				super.moveUp();
		}
		public override function moveDown():void
		{
			if(slowed)
				y+=yVelocity/2;
			else
				super.moveDown();
		}
		public function setSlowed(b:Boolean):void
		{
			slowed = b;
			if(slowed)
			{
				slowedTimer = 0;
				imageTimer = 0;
				shootLimit = 40;
			}
		}
		public override function checkKeysDown(evt:Event):void
		{
			if(!GameManager.gameIsPaused() && health>0 && GameManager.playerControlsAreActive())
			{
				var oldDir:Number = dir;
				changedDir = false;
				
				if(ID == 1)
				{
					if(keyListener.hasKeyDown(ControlsManager.getP1LeftKey()))
					{
						if(keyListener.hasKeyDown(ControlsManager.getP1UpKey()))
							dir = 7;
						else if(keyListener.hasKeyDown(ControlsManager.getP1DownKey()))
							dir = 5;
						else 
							dir = 6;
						
						if(dir!=oldDir)
							changedDir = true;
						
						if(x>10 && !changedDir && !pivoting)
							moveLeft();
					}
					if(keyListener.hasKeyDown(ControlsManager.getP1RightKey()))
					{
						if(keyListener.hasKeyDown(ControlsManager.getP1UpKey()))
							dir = 1;
						else if(keyListener.hasKeyDown(ControlsManager.getP1DownKey()))
							dir = 3;
						else
							dir = 2;
						
						if(dir!=oldDir)
							changedDir = true;
						
						if(x<590 && !changedDir && !pivoting)
							moveRight();
					}
					if(keyListener.hasKeyDown(ControlsManager.getP1UpKey()))
					{
						if(keyListener.hasKeyDown(ControlsManager.getP1LeftKey()))
							dir = 7;
						else if(keyListener.hasKeyDown(ControlsManager.getP1RightKey()))
							dir = 1;
						else
							dir = 0;
						
						if(dir!=oldDir)
							changedDir = true;
						
						if(y>50 && !changedDir && !pivoting)
							moveUp();
					}
					if(keyListener.hasKeyDown(ControlsManager.getP1DownKey()))
					{
						if(keyListener.hasKeyDown(ControlsManager.getP1LeftKey()))
							dir = 5;
						else if(keyListener.hasKeyDown(ControlsManager.getP1RightKey()))
							dir = 3;
						else
							dir = 4;
						
						if(dir!=oldDir)
							changedDir = true;
						
						if(y<270 && !changedDir && !pivoting)
							moveDown();
					}
					if(keyListener.hasKeyDown(ControlsManager.getP1ShootKey()))
						shoot();
					if(keyListener.hasKeyDown(ControlsManager.getP1ShieldKey()) && !shielding)
						shield();
					else if(!keyListener.hasKeyDown(ControlsManager.getP1ShieldKey()))
					{
						if(shielding)
							removeShield();
						pivoting = false;
					}
				}
				else if(ID == 2)
				{
					if(keyListener.hasKeyDown(ControlsManager.getP2LeftKey()))
					{
						if(keyListener.hasKeyDown(ControlsManager.getP2UpKey()))
							dir = 7;
						else if(keyListener.hasKeyDown(ControlsManager.getP2DownKey()))
							dir = 5;
						else 
							dir = 6;
						
						if(dir!=oldDir)
							changedDir = true;
						
						if(x>10 && !changedDir && !pivoting)
							moveLeft();
					}
					if(keyListener.hasKeyDown(ControlsManager.getP2RightKey()))
					{
						if(keyListener.hasKeyDown(ControlsManager.getP2UpKey()))
							dir = 1;
						else if(keyListener.hasKeyDown(ControlsManager.getP2DownKey()))
							dir = 3;
						else
							dir = 2;
						
						if(dir != oldDir)
							changedDir = true;
						
						if(x<590 && !changedDir && !pivoting)
							moveRight();
					}
					if(keyListener.hasKeyDown(ControlsManager.getP2UpKey()))
					{
						if(keyListener.hasKeyDown(ControlsManager.getP2LeftKey()))
							dir = 7;
						else if(keyListener.hasKeyDown(ControlsManager.getP2RightKey()))
							dir = 1;
						else
							dir = 0;
						
						if(dir!=oldDir)
							changedDir = true;
						
						if(y>50 && !changedDir && !pivoting)
							moveUp();
					}
					if(keyListener.hasKeyDown(ControlsManager.getP2DownKey()))
					{
						if(keyListener.hasKeyDown(ControlsManager.getP2LeftKey()))
							dir = 5;
						else if(keyListener.hasKeyDown(ControlsManager.getP2RightKey()))
							dir = 3;
						else
							dir = 4;
						
						if(dir!=oldDir)
							changedDir = true;
						
						if(y<270 && !changedDir && !pivoting)
							moveDown();
					}
					if(keyListener.hasKeyDown(ControlsManager.getP2ShootKey()))
						shoot();
					if(keyListener.hasKeyDown(ControlsManager.getP2ShieldKey()) && !shielding)
						shield();
					else if(!keyListener.hasKeyDown(ControlsManager.getP2ShieldKey()))
					{
						if(shielding)
							removeShield();
						pivoting = false;
					}
				}
			}
		}
		public override function addToParent(p:Object):void
		{
			super.addToParent(p);
			healthbar.addToParent(p);
			comboBucket.addToParent(p);
			playerArrow.addToParent(p);
			playerShield.addToParent(p);
		}
		public override function removeFromStage():void
		{
			for(var j = 0;j<GameManager.getMiscList().listSize();j++)
			{
				var mi:Entity = (GameManager.getMiscList().getObject(j) as Entity);
				if(mi is PlayerMissile && (mi as PlayerMissile).getSourceEntity() == this)
					(mi as PlayerMissile).removeFromStage();
			}
			healthbar.removeFromStage();
			comboBucket.removeFromStage();
			playerArrow.removeFromStage();
			playerShield.removeFromStage();
			healthbar = null;
			comboBucket = null;
			playerArrow = null;
			playerShield = null;
			color = null;
			super.removeFromStage();
		}
		public function setShootLimit(n:Number):void
		{
			shootLimit = n;
		}
		public function setInvulnerabilityDuration(n:Number):void
		{	
			invulnerabilityDuration = n;
		}
		public function setFlashing(b:Boolean):void
		{
			flashing = b;
		}
		public function activateSuperSpeed():void
		{
			shootLimit = 10;
			fastShotTimer = 240;
		}
		public function activateSplitShot():void
		{
			splitShotTimer = 240;
			if(!usingSplitShot)
				usingSplitShot = true;
		}
		public override function die():void
		{
			var explosion:PlayerExplosion = new PlayerExplosion(this);
			explosion.addToParent(GameManager.getTimeline());
			AudioManager.playAudio(AudioManager.getSplatterSoundTwo());
				
			super.die();
		}
	}
}