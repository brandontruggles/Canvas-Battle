package  
{	
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundMixer;
	import flash.media.SoundTransform;
	
	public class AudioManager 
	{
		private static var titlescreenMusic:TitlescreenMusic;
		private static var backgroundMusicOne:BackgroundMusicOne;
		private static var backgroundMusicTwo:BackgroundMusicTwo;
		private static var backgroundMusicThree:BackgroundMusicThree;
		private static var chaosMusic:ChaosMusic;
		private static var tutorialMusic:TutorialMusic;
		private static var bossMusic:BossMusic;
		private static var logoEntranceSound:LogoEntranceSound;
		private static var logoBuzzSound:LogoBuzzSound;
		private static var logoExitSound:LogoExitSound;
		private static var cutsceneMusic:CutsceneMusic;
		private static var cutsceneStepSound:CutsceneStepSound;
		private static var cutsceneThunderSound:CutsceneThunderSound;
		private static var cutscenePaintNoise:CutscenePaintNoise;
		private static var cutsceneOldmanSoundOne:CutsceneOldmanSoundOne;
		private static var cutsceneOldmanSoundTwo:CutsceneOldmanSoundTwo;
		private static var cutsceneOldmanSoundThree:CutsceneOldmanSoundThree;
		private static var cutsceneExplosionSplatterSound:CutsceneExplosionSplatterSound;
		private static var cutsceneDoorSound:CutsceneDoorSound;
		private static var cutsceneChaoticMusic:CutsceneChaoticMusic;
		private static var brushDingSound:BrushDingSound;
		private static var brushDoubleDingSound:BrushDoubleDingSound;
		private static var bubblePopSound:BubblePopSound;
		private static var waterAttackSound:WaterAttackSound;
		private static var waterBossDeathSound:WaterBossDeathSound;
		private static var alarmSound:AlarmSound;
		private static var playerFireSound:PlayerFireSound;
		private static var splatterSoundTwo:SplatterSoundTwo;
		private static var splatterSoundOne:SplatterSoundOne;
		private static var shieldBreakSound:ShieldBreakSound;
		private static var powerUpSound:PowerUpSound;
		private static var powerDownSound:PowerDownSound;
		private static var newCanvasSound:NewCanvasSound;
		private static var nightmareCanvasSound:NightmareCanvasSound;
		private static var comboSound:ComboSound;
		private static var gameOverSound:GameOverSound;
		private static var eggHatchSound:EggHatchSound;
		private static var paintapedeCrawlSound:PaintapedeCrawlSound;
		private static var paintapedeInjuredSoundOne:PaintapedeInjuredSoundOne;
		private static var paintapedeInjuredSoundTwo:PaintapedeInjuredSoundTwo;
		private static var chaoticGrowlSound:ChaoticGrowlSound;
		private static var chaoticDeathCry:ChaoticDeathCry;
		private static var chaoticBossExplosionSound:ChaoticBossExplosionSound;
		private static var tutorialCompleteSound:TutorialCompleteSound;
		private static var paintSwipeSound:PaintSwipeSound;
		private static var paintBrushExplosionSound:PaintBrushExplosionSound;
		private static var songList:ArrayList;
		private static var fxList:ArrayList;
		private static var songChannel:SoundChannel;
		private static var fxChannel:SoundChannel;
		
		public static function init():void
		{
			titlescreenMusic = new TitlescreenMusic();
			backgroundMusicOne = new BackgroundMusicOne();
			backgroundMusicTwo = new BackgroundMusicTwo();
			backgroundMusicThree = new BackgroundMusicThree();
			chaosMusic = new ChaosMusic();
			chaoticDeathCry = new ChaoticDeathCry();
			tutorialMusic = new TutorialMusic();
			cutsceneMusic = new CutsceneMusic();
		    cutsceneStepSound = new CutsceneStepSound();
		    cutsceneThunderSound = new CutsceneThunderSound();
		    cutscenePaintNoise = new CutscenePaintNoise();
		    cutsceneOldmanSoundOne = new CutsceneOldmanSoundOne();
			cutsceneOldmanSoundTwo = new CutsceneOldmanSoundTwo();
			cutsceneOldmanSoundThree = new CutsceneOldmanSoundThree();
 			cutsceneExplosionSplatterSound = new CutsceneExplosionSplatterSound();
			cutsceneDoorSound = new CutsceneDoorSound();
			cutsceneChaoticMusic = new CutsceneChaoticMusic();
			bossMusic = new BossMusic();
			logoEntranceSound = new LogoEntranceSound();
			logoBuzzSound = new LogoBuzzSound();
			logoExitSound = new LogoExitSound();
			brushDingSound = new BrushDingSound();
			brushDoubleDingSound = new BrushDoubleDingSound();
			bubblePopSound = new BubblePopSound();
			waterAttackSound = new WaterAttackSound();
			waterBossDeathSound = new WaterBossDeathSound();
			alarmSound = new AlarmSound();
			playerFireSound = new PlayerFireSound();
			splatterSoundTwo = new SplatterSoundTwo();
			splatterSoundOne = new SplatterSoundOne();
			shieldBreakSound = new ShieldBreakSound();
			powerUpSound = new PowerUpSound();
			powerDownSound = new PowerDownSound();
			newCanvasSound = new NewCanvasSound();
			nightmareCanvasSound = new NightmareCanvasSound();
			comboSound = new ComboSound();
			gameOverSound = new GameOverSound();
			eggHatchSound = new EggHatchSound();
			paintapedeCrawlSound = new PaintapedeCrawlSound();
			paintapedeInjuredSoundOne = new PaintapedeInjuredSoundOne();
			paintapedeInjuredSoundTwo = new PaintapedeInjuredSoundTwo();
			chaoticGrowlSound = new ChaoticGrowlSound();
			chaoticBossExplosionSound = new ChaoticBossExplosionSound();
			tutorialCompleteSound = new TutorialCompleteSound();
			paintSwipeSound = new PaintSwipeSound();
			paintBrushExplosionSound = new PaintBrushExplosionSound();
			songList = new ArrayList();
			fxList = new ArrayList();
			songChannel = new SoundChannel();
			fxChannel = new SoundChannel();
			songList.addObject(titlescreenMusic);
			songList.addObject(backgroundMusicOne);
			songList.addObject(backgroundMusicTwo);
			songList.addObject(backgroundMusicThree);
			songList.addObject(chaosMusic);
			songList.addObject(tutorialMusic);
			songList.addObject(bossMusic);
			fxList.addObject(cutsceneMusic);
		    fxList.addObject(cutsceneStepSound);
		    fxList.addObject(cutsceneThunderSound);
		    fxList.addObject(cutscenePaintNoise);
		    fxList.addObject(cutsceneOldmanSoundOne);
			fxList.addObject(cutsceneOldmanSoundTwo);
			fxList.addObject(cutsceneOldmanSoundThree);
 			fxList.addObject(cutsceneExplosionSplatterSound);
			fxList.addObject(cutsceneDoorSound);
			fxList.addObject(cutsceneChaoticMusic);
			fxList.addObject(chaoticDeathCry);
			fxList.addObject(logoEntranceSound);
			fxList.addObject(logoBuzzSound);
			fxList.addObject(logoExitSound);
			fxList.addObject(brushDingSound);
			fxList.addObject(brushDoubleDingSound);
			fxList.addObject(bubblePopSound);
			fxList.addObject(waterAttackSound);
			fxList.addObject(waterBossDeathSound);
			fxList.addObject(alarmSound);
			fxList.addObject(playerFireSound);
			fxList.addObject(splatterSoundTwo);
			fxList.addObject(splatterSoundOne);
			fxList.addObject(shieldBreakSound);
			fxList.addObject(powerUpSound);
			fxList.addObject(powerDownSound);
			fxList.addObject(newCanvasSound);
			fxList.addObject(nightmareCanvasSound);
			fxList.addObject(comboSound);
			fxList.addObject(gameOverSound);
			fxList.addObject(eggHatchSound);
			fxList.addObject(paintapedeCrawlSound);
			fxList.addObject(paintapedeInjuredSoundOne);
			fxList.addObject(paintapedeInjuredSoundTwo);
			fxList.addObject(chaoticGrowlSound);
			fxList.addObject(chaoticBossExplosionSound);
			fxList.addObject(tutorialCompleteSound);
			fxList.addObject(paintSwipeSound);
			fxList.addObject(paintBrushExplosionSound);
			songChannel.soundTransform = new SoundTransform(GameManager.getBGPercentage()/100);
			fxChannel.soundTransform = new SoundTransform(GameManager.getFXPercentage()/100);
		}
		public static function getTitlescreenMusic():TitlescreenMusic
		{
			return titlescreenMusic;
		}
		public static function getBackgroundMusicOne():BackgroundMusicOne
		{
			return backgroundMusicOne;
		}
		public static function getBackgroundMusicTwo():BackgroundMusicTwo
		{
			return backgroundMusicTwo;
		}
		public static function getBackgroundMusicThree():BackgroundMusicThree
		{
			return backgroundMusicThree;
		}
		public static function getChaosMusic():ChaosMusic
		{
			return chaosMusic;
		}
		public static function getTutorialMusic():TutorialMusic
		{
			return tutorialMusic;
		}
		public static function getCutsceneMusic():CutsceneMusic
		{
			return cutsceneMusic;
		}
		public static function getCutsceneStepSound():CutsceneStepSound
		{
			return cutsceneStepSound;
		}
		public static function getCutsceneThunderSound():CutsceneThunderSound
		{
			return cutsceneThunderSound;
		}
		public static function getCutscenePaintNoise():CutscenePaintNoise
		{
			return cutscenePaintNoise;
		}
		public static function getCutsceneOldmanSoundOne():CutsceneOldmanSoundOne
		{
			return cutsceneOldmanSoundOne;
		}
		public static function getCutsceneOldmanSoundTwo():CutsceneOldmanSoundTwo
		{
			return cutsceneOldmanSoundTwo;
		}
		public static function getCutsceneOldmanSoundThree():CutsceneOldmanSoundThree
		{
			return cutsceneOldmanSoundThree;
		}
		public static function getCutsceneExplosionSplatterSound():CutsceneExplosionSplatterSound
		{
			return cutsceneExplosionSplatterSound;
		}
		public static function getCutsceneDoorSound():CutsceneDoorSound
		{
			return cutsceneDoorSound;
		}
		public static function getCutsceneChaoticMusic():CutsceneChaoticMusic
		{
			return cutsceneChaoticMusic;
		}
		public static function getBossMusic():BossMusic
		{
			return bossMusic;
		}
		public static function getLogoEntranceSound():LogoEntranceSound
		{
			return logoEntranceSound;
		}
		public static function getLogoBuzzSound():LogoBuzzSound
		{
			return logoBuzzSound;
		}
		public static function getLogoExitSound():LogoExitSound
		{
			return logoExitSound;
		}
		public static function getBrushDingSound():BrushDingSound
		{
			return brushDingSound;
		}
		public static function getBrushDoubleDingSound():BrushDoubleDingSound
		{
			return brushDoubleDingSound;
		}
		public static function getBubblePopSound():BubblePopSound
		{
			return bubblePopSound;
		}
		public static function getWaterAttackSound():WaterAttackSound
		{
			return waterAttackSound;
		}
		public static function getWaterBossDeathSound():WaterBossDeathSound
		{
			return waterBossDeathSound;
		}
		public static function getAlarmSound():AlarmSound
		{
			return alarmSound;
		}
		public static function getPlayerFireSound():PlayerFireSound
		{
			return playerFireSound;
		}
		public static function getSplatterSoundOne():SplatterSoundOne
		{
			return splatterSoundOne;
		}
		public static function getSplatterSoundTwo():SplatterSoundTwo
		{
			return splatterSoundTwo;
		}
		public static function getShieldBreakSound():ShieldBreakSound
		{
			return shieldBreakSound;
		}
		public static function getPowerUpSound():PowerUpSound
		{
			return powerUpSound;
		}
		public static function getPowerDownSound():PowerDownSound
		{
			return powerDownSound;
		}
		public static function getNewCanvasSound():NewCanvasSound
		{
			return newCanvasSound;
		}
		public static function getNightmareCanvasSound():NightmareCanvasSound
		{
			return nightmareCanvasSound;
		}
		public static function getComboSound():ComboSound
		{
			return comboSound;
		}
		public static function getGameOverSound():GameOverSound
		{
			return gameOverSound;
		}
		public static function getEggHatchSound():EggHatchSound
		{
			return eggHatchSound;
		}
		public static function getPaintapedeCrawlSound():PaintapedeCrawlSound
		{
			return paintapedeCrawlSound;
		}
		public static function getPaintapedeInjuredSoundOne():PaintapedeInjuredSoundOne
		{
			return paintapedeInjuredSoundOne;
		}
		public static function getPaintapedeInjuredSoundTwo():PaintapedeInjuredSoundTwo
		{
			return paintapedeInjuredSoundTwo;
		}
		public static function getChaoticGrowlSound():ChaoticGrowlSound
		{
			return chaoticGrowlSound;
		}
		public static function getChaoticDeathCry():ChaoticDeathCry
		{
			return chaoticDeathCry;
		}
		public static function getChaoticBossExplosionSound():ChaoticBossExplosionSound
		{
			return chaoticBossExplosionSound;
		}
		public static function getTutorialCompleteSound():TutorialCompleteSound
		{
			return tutorialCompleteSound;
		}
		public static function getPaintSwipeSound():PaintSwipeSound
		{
			return paintSwipeSound;
		}
		public static function getPaintBrushExplosionSound():PaintBrushExplosionSound
		{
			return paintBrushExplosionSound;
		}
		public static function getSongChannel():SoundChannel
		{
			return songChannel;
		}
		public static function getFXChannel():SoundChannel
		{
			return fxChannel;
		}
		public static function playAudio(s:Sound):void
		{
			if(songList.containsObject(s))
			{
				songChannel = s.play();
				if(songChannel != null)
					songChannel.soundTransform = new SoundTransform(GameManager.getBGPercentage()/100);
			}
			else if(fxList.containsObject(s))
			{
				fxChannel = s.play();
				if(fxChannel != null)
					fxChannel.soundTransform = new SoundTransform(GameManager.getFXPercentage()/100);
			}
		}
		public static function loopAudio(s:Sound):void
		{
			if(songList.containsObject(s))
			{
				songChannel = s.play(0,999999);
				if(songChannel!=null)
					songChannel.soundTransform = new SoundTransform(GameManager.getBGPercentage()/100);
			}
			else if(fxList.containsObject(s))
			{
				fxChannel = s.play(0,999999);
				if(fxChannel!=null)
					fxChannel.soundTransform = new SoundTransform(GameManager.getFXPercentage()/100);
			}
		}
		public static function stopAudio(s:Sound):void
		{
			if(songList.containsObject(s))
				songChannel.stop();
			else if(fxList.containsObject(s))
				fxChannel.stop();
		}
		public static function stopAllAudio():void
		{
			SoundMixer.stopAll();
		}
	}
}