package 
{	
	import flash.events.Event;
	import flash.display.Stage;
	import flash.display.MovieClip;
	import flash.geom.ColorTransform;
	import flash.media.SoundTransform;
	import flash.system.System;

	public class GameManager
	{
		private static var mainStage:Stage;
		//Stage of the game
		private static var mainTimeline:Object;
		//Main timeline, controls the SWF
		private static var difficulty:Number;
		//easy = 0
		//medium = 1
		//hard = 2
		private static var gameMode:Number;
		//tutorial = 0
		//singleplayer = 1
		//co-op = 2
		private static var gamePaused:Boolean;
		//true = paused
		//false = unpaused
		private static var gameActive:Boolean;
		//true = active
		//false = inactive
		private static var bossSpawned:Boolean;
		//true = boss or mini boss on stage
		//false = no boss or mini boss on stage
		private static var countdownVisibility:Boolean;
		//true = visible
		//false = invisible
		private static var initialized:Boolean = false;
		private static var loginReminder:Boolean;
		private static var timeSlowed:Boolean;
		private static var oneUpApplied:Boolean;
		private static var overlayAllowed:Boolean;
		private static var showedCustomNotification:Boolean;
		private static var playerControlsActive:Boolean;
		private static var score:Number;
		private static var currentDimension:Number;
		private static var p1Color:ColorTransform;
		private static var p2Color:ColorTransform;
		private static var timeSlowTimer:Number;
		private static var extraLifeScore:Number;
		private static var bgPercentage:Number;
		private static var fxPercentage:Number;
		private static var miscList:ArrayList;
		private static var playerList:ArrayList;
		private static var enemyList:ArrayList;
		private static var tutorialBanner:TutorialTextBanner;
		private static var paintOverlay:PaintOverlay;
		
		public static function init(s:Stage,t:Object):void
		{
			mainStage = s;
			mainTimeline = t;
			difficulty = 0;
			gameMode = 0;
			score = 0;
			timeSlowTimer = 0;
			bgPercentage = 50;
			fxPercentage = 50;
			extraLifeScore = 2500;
			currentDimension = DIMENSION_NORMAL();
			gamePaused = true;
			loginReminder = true;
			gameActive = false;
			timeSlowed = false;
			countdownVisibility = false;
			oneUpApplied = false;
			overlayAllowed = true;
			showedCustomNotification = false;
			playerControlsActive = false;
			initialized = true;
			p1Color = new ColorTransform(0,0,0,1,0,0,255);
			p2Color = new ColorTransform(0,0,0,1,153,0,0);
			miscList = new ArrayList();
			playerList = new ArrayList();
			enemyList = new ArrayList()
			ControlsManager.init();
			CanvasManager.init();
			SpawnManager.init();
			TutorialManager.init();
			AudioManager.init();
		}
		public static function isInitialized():Boolean
		{
			return initialized;
		}
		public static function timeIsSlowed():Boolean
		{
			return timeSlowed;
		}
		public static function loginReminderEnabled():Boolean
		{
			return loginReminder;
		}
		public static function overlayIsAllowed():Boolean
		{
			return overlayAllowed;
		}
		public static function playerControlsAreActive():Boolean
		{
			return playerControlsActive;
		}
		public static function getGameMode():Number
		{
			return gameMode;
		}
		public static function getDifficulty():Number
		{
			return difficulty;
		}
		public static function gameIsPaused():Boolean
		{
			return gamePaused;
		}
		public static function getScore():Number
		{
			return score;
		}
		public static function gameIsActive():Boolean
		{
			return gameActive;
		}
		public static function getCountdownVisibility():Boolean
		{
			return countdownVisibility;
		}
		public static function getMiscList():ArrayList
		{
			return miscList;
		}
		public static function getPlayerList():ArrayList
		{
			return playerList;
		}
		public static function getEnemyList():ArrayList
		{
			return enemyList;
		}
		public static function getP1Color():ColorTransform
		{
			return p1Color;
		}
		public static function getP2Color():ColorTransform
		{
			return p2Color;
		}
		public static function getBGPercentage():Number
		{
			return bgPercentage;
		}
		public static function getFXPercentage():Number
		{
			return fxPercentage;
		}
		public static function getCurrentDimension():Number
		{
			return currentDimension;
		}
		public static function getStage():Stage
		{
			return mainStage;
		}
		public static function getTimeline():Object
		{
			return mainTimeline;
		}
		public static function getTutorialBanner():TutorialTextBanner
		{
			return tutorialBanner;
		}
		public static function getPaintOverlay():PaintOverlay
		{
			return paintOverlay;
		}
		public static function setLoginReminder(b:Boolean):void
		{
			loginReminder = b;
		}
		public static function setOverlayAllowed(b:Boolean):void
		{
			overlayAllowed = b;
		}
		public static function setPlayerControlsActive(b:Boolean):void
		{
			playerControlsActive = b;
		}
		public static function setPaintOverlay(p:PaintOverlay):void
		{
			if(paintOverlay!=null)
				paintOverlay.removeFromStage();
			paintOverlay = p;
			p.addToParent(GameManager.getTimeline());
		}
		public static function setTutorialBanner(t:TutorialTextBanner):void
		{
			tutorialBanner = t;
		}
		public static function updateTimers(evt:Event):void
		{
				if(GameManager.getGameMode()!=0)
					SpawnManager.updateTimers(evt);
				
				if(!gameIsPaused() && CanvasManager.getNumberOfCanvasesUnlocked() == 5 && !showedCustomNotification)
				{
					gamePaused = true;
					
					for(var i4 = 0;i4<miscList.listSize();i4++)
					{
						if(!(miscList.getObject(i4) is TutorialTextBanner))
							miscList.getObject(i4).stopPlaying();
					}
					for(var i5 = 0;i5<playerList.listSize();i5++)
					{
						playerList.getObject(i5).stopPlaying();
					}
					for(var i6 = 0;i6<enemyList.listSize();i6++)
					{
						enemyList.getObject(i6).stopPlaying();
					}
					
					var ccu:CustomCanvasUnlockMenu = new CustomCanvasUnlockMenu();
					ccu.addToParent(mainTimeline);
					
					showedCustomNotification = true;
			}
			if(gameIsActive() && !gameIsPaused() && gameMode == 0)
			{
				if(tutorialBanner == null)
				{
					tutorialBanner = new TutorialTextBanner();
					tutorialBanner.addToParent(mainTimeline);
				}
			}
			if(gameIsActive() && !GameManager.gameIsPaused())
			{
				if(timeSlowed)
				{
					if(timeSlowTimer<240)
					timeSlowTimer++;
					else
					setTimeSlowed(false);
				}
			}
		}
		public static function getExtraLifeScore():Number
		{
			return extraLifeScore;
		}
		public static function DIMENSION_NORMAL():Number
		{
			return 0;
		}
		public static function DIMENSION_CHAOTIC():Number
		{
			return 1;
		}
		public static function setOneUpApplied(a:Boolean)
		{
			oneUpApplied = a;
		}
		public static function playBackgroundMusic():void
		{
			var rand:Number = Math.round(Math.random()*2);
			
			if(rand == 0)
				AudioManager.loopAudio(AudioManager.getBackgroundMusicOne());
			else if(rand == 1)
				AudioManager.loopAudio(AudioManager.getBackgroundMusicTwo());
			else if(rand == 2)
				AudioManager.loopAudio(AudioManager.getBackgroundMusicThree());
		}
		public static function switchDimensions():void
		{
			APIManager.submitVisitedChaosDimension();
			
			paintOverlay.clean();
			
			while(enemyList.listSize()>0)
				enemyList.getObject(0).removeFromStage();
			
			for(var i = 0;i<miscList.listSize();i++)
			{
				var misc:Entity = (miscList.getObject(i) as Entity);
				if(!(misc is HealthBar) && !(misc is ComboBucket) && !(misc is PlayerArrow) && !(misc is PaintOverlay) && !(misc is PlayerShield))
				{	
					misc.removeFromStage();
					i = 0;
				}
			}
			
			if(currentDimension == DIMENSION_NORMAL())
			{
				AudioManager.stopAllAudio();
				AudioManager.loopAudio(AudioManager.getChaosMusic());
				currentDimension = DIMENSION_CHAOTIC();
				
				if(!CanvasManager.thirdCanvasIsUnlocked())
				{
					var c:Canvas = new Canvas(700,150,3);
					c.addToParent(mainTimeline);
				}
			}
			else
			{
				currentDimension = DIMENSION_NORMAL();
				AudioManager.stopAllAudio();
				playBackgroundMusic();
			}
			
			var portal:Portal = new Portal(50,Math.random()*220+50,Portal.TYPE_ENTRANCE());
			portal.addToParent(mainTimeline);
			
		}
		public static function setScore(s:Number):void
		{
			score = s;
			if(mainTimeline.currentFrame == 7)
			{
				mainTimeline.gameGUI.topGUIBar.scoreText.text = getScore();
				if(GameManager.getGameMode() == 1 || GameManager.getGameMode() == 2)
				if(score>=extraLifeScore && !oneUpApplied)
				{	
					mainTimeline.gameGUI.topGUIBar.scoreText.textColor = new ColorTransform(0,0,0,0,40,255,40,1).color;
					for(var i = 0;i<GameManager.getPlayerList().listSize();i++)
					{
						var oneUp:OneUpBanner = new OneUpBanner((GameManager.getPlayerList().getObject(i) as Player));
						oneUp.addToParent(mainTimeline);
						AudioManager.playAudio(AudioManager.getPowerUpSound());
					}
					oneUpApplied = true;
					if(GameManager.getGameMode() == 2 && GameManager.getPlayerList().listSize() == 1)
					{
						GameManager.setPaused(true);
				
						for(var i2 = 0;i2<GameManager.getMiscList().listSize();i2++)
						{
							var m:Entity = (GameManager.getMiscList().getObject(i2) as Entity);
							if(!(m is TutorialTextBanner))
								m.stopPlaying();
						}
						for(var i3 = 0;i3<GameManager.getPlayerList().listSize();i3++)
						{
							var p:PlayerBall = (GameManager.getPlayerList().getObject(i3) as PlayerBall);
							p.stopPlaying();
						}
						for(var i4 = 0;i4<GameManager.getEnemyList().listSize();i4++)
						{
							var e:Enemy = (GameManager.getEnemyList().getObject(i4) as Enemy);
							e.stopPlaying();
						}
						
						var m2:MultiPlayerDeathMenu = new MultiPlayerDeathMenu((GameManager.getPlayerList().getObject(0) as PlayerBall));
						m2.addToParent(GameManager.getTimeline());
						
						if(GameManager.getDifficulty() == 1)
							GameManager.setExtraLifeScore(Math.round(GameManager.getScore()/2)+500);
						else if(GameManager.getDifficulty() == 2)
							GameManager.setExtraLifeScore(Math.round(GameManager.getScore()/2)+1250);
						else if(GameManager.getDifficulty() == 3)
							GameManager.setExtraLifeScore(Math.round(GameManager.getScore()/2)+2500);
					}
				}
			}
		}
		public static function setDifficulty(d:Number):void
		{
			difficulty = d;
		}
		public static function setPaused(b:Boolean):void
		{
			gamePaused = b;
		}
		public static function setGameMode(m:Number):void
		{
			gameMode = m;
		}
		public static function setGameActive(b:Boolean):void
		{
			gameActive = b;
		}
		public static function setExtraLifeScore(n:Number):void
		{
			extraLifeScore = n;
		}
		public static function setTimeSlowed(b:Boolean):void
		{
			var timeWasSlowed:Boolean = timeSlowed;
			
			timeSlowed = b;
			
			if(timeSlowed)
			{
				if(!timeWasSlowed)
				{
					for(var i = 0;i<enemyList.listSize();i++)
					{
						var e:Enemy = (enemyList.getObject(i) as Enemy);
						if(!(e is PaintapedeHead) && !(e is Minipede) && !(e is Boss))
						{
							e.setXVelocity(e.getXVelocity()/2);
							e.setYVelocity(e.getYVelocity()/2);
							if(e is ShootingEnabled)
							{
								(e as ShootingEnabled).setShootLimiter((e as ShootingEnabled).getShootLimiter()*2);
							}
						}
					}
					for(var i2 = 0;i2<miscList.listSize();i2++)
					{
						var m:Entity = (miscList.getObject(i2) as Entity);
						if(m is Missile && !(m is PlayerMissile))
						{
							var m2:Missile = (m as Missile);
							m2.setXVelocity(m2.getXVelocity()/2);
							m2.setYVelocity(m2.getYVelocity()/2);
						}
						else if(m is PowerUp)
						{
							var p:PowerUp = (m as PowerUp);
							p.setFloatSpeed(p.getFloatSpeed()/2);
						}
					}
				}
				timeSlowTimer = 0;
			}
			else
			{
				for(var i3 = 0;i3<enemyList.listSize();i3++)
				{
					var e2:Enemy = (enemyList.getObject(i3) as Enemy);
					
					if(!(e2 is PaintapedeHead) && !(e2 is Minipede) && !(e2 is Boss))
					{
						e2.setXVelocity(e2.getXVelocity()*2);
						e2.setYVelocity(e2.getYVelocity()*2);
					}
					
					if(e2 is ShootingEnabled)
					{
						(e2 as ShootingEnabled).setShootLimiter((e2 as ShootingEnabled).getShootLimiter()/2);
					}
				}
				for(var i4 = 0;i4<miscList.listSize();i4++)
				{
					var m3:Entity = (miscList.getObject(i4) as Entity);
					
					if(m3 is Missile && !(m3 is PlayerMissile))
					{
						var m4:Missile = (miscList.getObject(i4) as Missile);
						m4.setXVelocity(m4.getXVelocity()*2);
						m4.setYVelocity(m4.getYVelocity()*2);
					}
					else if(m3 is PowerUp)
					{
						var p2:PowerUp = (m3 as PowerUp);
						p2.setFloatSpeed(p2.getFloatSpeed()*2);
					}
				}
			}
		}
		public static function setCountdownVisibility(b:Boolean):void
		{
			countdownVisibility = b;
		}
		public static function setP1Color(c:ColorTransform):void
		{
			p1Color = c;
		}
		public static function setP2Color(c:ColorTransform):void
		{
			p2Color = c;
		}
		public static function setBGPercentage(p:Number):void
		{
			bgPercentage = p;
			AudioManager.getSongChannel().soundTransform = new SoundTransform(bgPercentage/100);
		}
		public static function setFXPercentage(p:Number):void
		{
			fxPercentage = p;
			AudioManager.getFXChannel().soundTransform = new SoundTransform(fxPercentage/100);
		}
		public static function endCurrentGame():void
		{
			gameActive = false;
			timeSlowed = false;
			oneUpApplied = false;
			mainTimeline.gameGUI.topGUIBar.scoreText.textColor = new ColorTransform(0,0,0,0,255,255,255,1).color;
			SpawnManager.init();
			currentDimension = DIMENSION_NORMAL();
			timeSlowTimer = 0;
			
			mainTimeline.removeGameListeners();
			
			while(miscList.listSize()>0)
				miscList.getObject(0).removeFromStage();
			
			while(enemyList.listSize()>0)
				enemyList.getObject(0).removeFromStage();
			
			if(getGameMode() == 0)
			{
				if(GameManager.getPlayerList().listSize()>0)
				{
					tutorialBanner = null;
					mainTimeline.gotoAndStop(5);
				}
				else
				{
					tutorialBanner = null;
					mainTimeline.gotoAndStop(9);
				}
					
				TutorialManager.init();
			}
			else if(getGameMode() == 1)
			{
				if(playerList.listSize() == 0)
				{
					mainTimeline.gotoAndStop(8);
					mainTimeline.gameOverMenu.finalScore.text = getScore();
				}
			}
			else if(getGameMode() == 2)
			{
				if(playerList.listSize() == 0)
				{
					mainTimeline.gotoAndStop(8);
					mainTimeline.gameOverMenu.finalScore.text = getScore();
				}
			}
			
			
			while(playerList.listSize()>0)
				playerList.getObject(0).removeFromStage();
				
			AudioManager.stopAllAudio();
		}
	}
	
}