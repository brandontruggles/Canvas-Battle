package
{
	import flash.text.TextField;
	import flash.geom.ColorTransform;

	public class TutorialManager
	{
		private static var messageList:ArrayList;
		private static var currentMessageIndex:Number;
		private static var currentMessage:TutorialMessage;
		
		public static function init():void
		{
			messageList = new ArrayList();
			currentMessageIndex = 0;
			messageList.addObject(new TutorialMessage("Welcome to Canvas Battle!"));
			messageList.addObject(new TutorialMessage("This little guy right here is you. You're just a tiny paint blob on a canvas."));
			messageList.addObject(new TutorialMessage("But unfortunately for you, you aren't alone."));
			messageList.addObject(new TutorialMessage("There are many other paint blobs just like you fighting for dominance in this world of paint."));
			messageList.addObject(new TutorialMessage("Your goal is to eliminate as many of the other blobs as you can to gain the title of number one blob! Great title eh?"));
	   /*5*/messageList.addObject(new TutorialMessage("To do this, you'll need to know how to defend yourself."));
			messageList.addObject(new TutorialMessage("You can move around using WASD (default) and shoot with the Space key (default)."));
			messageList.addObject(new TutorialMessage("As a quick test, try shooting these targets!"));
			messageList.addObject(new TutorialMessage("Nice job!"));
			messageList.addObject(new TutorialMessage("You may have noticed that as you shot those targets, your score increased, and this jar of paint filled up slightly."));
	  /*10*/messageList.addObject(new TutorialMessage("This paint jar is your combo meter. If you're able to kill enemies while avoiding being hit, your combo meter will increase."));
			messageList.addObject(new TutorialMessage("Once your combo meter is completely filled, your combo multiplier (displayed on the meter) will go up by one."));
			messageList.addObject(new TutorialMessage("Each paint blob you destroy will increase your score by a certain amount multiplied by your current combo multiplier."));
			messageList.addObject(new TutorialMessage("When your score becomes high enough, your score will turn green, indicating that you have gained the opportunity to use an extra life."));
			messageList.addObject(new TutorialMessage("Of course, extra lives aren't free in this world! In exchange for being brought back to life, your score will also be cut in half, so choose wisely!"));
	  /*15*/messageList.addObject(new TutorialMessage("But enough about offense, let's talk about some defense."));
			messageList.addObject(new TutorialMessage("You can guard against incoming attacks by using your paint shield."));
			messageList.addObject(new TutorialMessage("Try to activate and deactivate your paint shield right now. Hold Shift (default) to activate it and release Shift (default) to deactivate it."));
			messageList.addObject(new TutorialMessage("That was pretty great shielding if you ask me!"));
			messageList.addObject(new TutorialMessage("As your shield is hit by enemies and their projectiles, it will slowly lose health and eventually break."));
	  /*20*/messageList.addObject(new TutorialMessage("The only way to replenish your shield's health is to defeat a boss enemy, but we'll get to that later."));
			messageList.addObject(new TutorialMessage("You may have noticed that while shielding, you are unable to move, but can still shoot and change directions."));
			messageList.addObject(new TutorialMessage("This is known as pivoting, and it can used even if your shield is depleted."));
			messageList.addObject(new TutorialMessage("As you would expect, if you get hit while not shielding, your own health bar (seen above) will decrease."));
			messageList.addObject(new TutorialMessage("To avoid confusion during multiplayer, your health bar and combo meter will always be the same color as you."));
	  /*25*/messageList.addObject(new TutorialMessage("You can change your color in the options menu by pausing the game and selecting options, or pressing the options button on the start menu."));
			messageList.addObject(new TutorialMessage("Why not try it right now? Get a color change! (Click the pause button below or press P (default) and click the options button)."));
			messageList.addObject(new TutorialMessage("How does it feel to now be the most attractive blob on the canvas? Does it feel good? Excellent."));
			messageList.addObject(new TutorialMessage("While you were in the options menu, you may have also noticed a few other settings that you can change."));
			messageList.addObject(new TutorialMessage("One of the most important settings you can change is the game's controls. If you feel uncomfortable using the game's default controls, feel free to change them at any time!"));
	  /*30*/messageList.addObject(new TutorialMessage("But that's enough of discussing the options menu...let's talk about enemies."));
			messageList.addObject(new TutorialMessage("Enemies will spawn in randomly generated waves,  meaning each time you play, things will be slightly different."));
			messageList.addObject(new TutorialMessage("This game has three types of enemies, normal enemies, mini bosses, and bosses. Who would have guessed?"));
			messageList.addObject(new TutorialMessage("Normal enemies take only one hit to kill, while mini bosses and bosses take more."));
			messageList.addObject(new TutorialMessage("Here's the most common normal enemy you'll come across, a green paint blob! Make it go boom!"));
	  /*35*/messageList.addObject(new TutorialMessage("Way to go!"));
			messageList.addObject(new TutorialMessage("Now let's introduce you to a mini boss. This pink paint blob will be a little trickier to eliminate."));
			messageList.addObject(new TutorialMessage("Well then, looks like you're getting pretty good at this!"));
			messageList.addObject(new TutorialMessage("Now is the part where we're supposed to show you an example of a boss...but why do that when you can discover them for yourself?"));
			messageList.addObject(new TutorialMessage("As you just saw, when an enemy or projectile explodes, it will leave a paint trail behind."));
	  /*40*/messageList.addObject(new TutorialMessage("These paint trails will remain on the screen and paint over the currently selected canvas as you play."));
			messageList.addObject(new TutorialMessage("However, if you do not wish to have the paint trails remain on the screen, you can switch off this feature in the options menu."));
			messageList.addObject(new TutorialMessage("Speaking of the canvas, there are 15 different canvases to choose from in canvas battle."));
			messageList.addObject(new TutorialMessage("These canvases are unlockable through collecting canvas power ups, and will allow you to change the background of the game."));
			messageList.addObject(new TutorialMessage("Canvas power ups will spawn randomly as you fight, except for 4 of them."));
	  /*45*/messageList.addObject(new TutorialMessage("These 4 canvases can only be obtained by killing the boss that guards them. Each of the 4 bosses in this game guards its own unique canvas, so in order to get all 15 canvases, you'll have to kill every boss at least once."));
	  		messageList.addObject(new TutorialMessage("One of these bosses is only accessible by visiting what is known as the chaos dimension."));
			messageList.addObject(new TutorialMessage("The only way to get into the chaos dimenson is to destroy a gray paint blob miniboss (shown right) and enter the portal it opens upon exploding."));
			messageList.addObject(new TutorialMessage("In order to destroy a gray paint blob, you must hit it the moment it turns red, so practice that timing!"));
			messageList.addObject(new TutorialMessage("After collecting 5 canvases, the ability to upload your own images to use as canvases will be unlocked."));
	  /*50*/messageList.addObject(new TutorialMessage("For the best looking results when uploading your own canvases, we reccomend using pictures with a width of 600 pixels and a height 300 pixels (only jpg and png file formats will work)."));
	  		messageList.addObject(new TutorialMessage("To view the canvases you've collected, or switch the current canvas you are using, you can press the c key (default), or click the canvas button on the bottom of the screen at any time."));
			messageList.addObject(new TutorialMessage("Aside from canvas power ups, there are many other power ups in canvas battle that will help you (or harm you) on the battlefield."));
			messageList.addObject(new TutorialMessage("Power ups will spawn randomly when enemies explode, but shield power ups will only spawn when a boss is defeated."));
			messageList.addObject(new TutorialMessage("Given that shield power ups are so difficult to obtain, be sure to use your shield sparingly!"));
	  /*55*/messageList.addObject(new TutorialMessage("Welp, that just about covers everything for this tutorial."));
			if(!CanvasManager.secondCanvasIsUnlocked())
	  			messageList.addObject(new TutorialMessage("But...before you go...why not take this free canvas!?"));
	  		else
				messageList.addObject(new TutorialMessage("Good luck out there!"));
	  		messageList.addObject(new TutorialMessage(""));
			currentMessage = (messageList.getObject(0) as TutorialMessage);
		}
		public static function getCurrentMessage():TutorialMessage
		{
			return currentMessage;
		}
		public static function getMessageIndex():Number
		{
			return currentMessageIndex;
		}
		public static function changeMessages():void
		{
			if(GameManager.getPlayerList().listSize()>0 || currentMessageIndex == 0)
			{
				currentMessageIndex++;
				if(currentMessageIndex<messageList.listSize())
					currentMessage = (messageList.getObject(currentMessageIndex) as TutorialMessage);
				processMessageEvent();
			}
		}
		public static function processMessageEvent():void
		{
			if(currentMessageIndex == 1)
			{
				var player1:PlayerSpawnEffect = new PlayerSpawnEffect(100,140);
				player1.addToParent(GameManager.getTimeline());
			}
			else if(currentMessageIndex == 7)
			{
				GameManager.setPlayerControlsActive(true);
				GameManager.getTimeline().gameGUI.bottomGUIBar.continueTextObject.visible = false;
				var t1:Target = new Target(450,100);
				t1.addToParent(GameManager.getTimeline());
				var t2:Target = new Target(450,175);
				t2.addToParent(GameManager.getTimeline());
				var t3:Target = new Target(450,250);
				t3.addToParent(GameManager.getTimeline());
			}
			else if(currentMessageIndex == 8)
			{
				GameManager.setPlayerControlsActive(false);
				GameManager.getTimeline().gameGUI.bottomGUIBar.continueTextObject.visible = true;
			}
			else if(currentMessageIndex == 9)
			{
				var p1:PointerArrow = new PointerArrow(28,120,1);
				p1.addToParent(GameManager.getTimeline());
			}
			else if(currentMessageIndex == 10)
			{
				removeArrowsFromStage();
			}
			else if(currentMessageIndex == 17)
			{
				GameManager.setPlayerControlsActive(true);
				GameManager.getTimeline().gameGUI.bottomGUIBar.continueTextObject.visible = false;
			}
			else if(currentMessageIndex == 18)
			{
				GameManager.setPlayerControlsActive(false);
				GameManager.getTimeline().gameGUI.bottomGUIBar.continueTextObject.visible = true;
			}
			else if(currentMessageIndex == 23)
			{
				var p2:PointerArrow = new PointerArrow(78,120,1);
				p2.addToParent(GameManager.getTimeline());
			}
			else if(currentMessageIndex == 24)
			{
				removeArrowsFromStage();
			}
			else if(currentMessageIndex == 26)
			{
				GameManager.setPlayerControlsActive(true);
				GameManager.getTimeline().gameGUI.bottomGUIBar.continueTextObject.visible = false;
				var p3:PointerArrow = new PointerArrow(578,200,3);
				p3.addToParent(GameManager.getTimeline());
			}
			else if(currentMessageIndex == 27)
			{
				GameManager.setPlayerControlsActive(false);
				GameManager.getTimeline().gameGUI.bottomGUIBar.continueTextObject.visible = true;
				removeArrowsFromStage();
			}
			else if(currentMessageIndex == 34)
			{
				GameManager.setPlayerControlsActive(true);
				GameManager.getTimeline().gameGUI.bottomGUIBar.continueTextObject.visible = false;
				var g:GreenBall = new GreenBall();
				g.addToParent(GameManager.getTimeline());
				g.y = 150;
			}
			else if(currentMessageIndex == 35)
			{
				GameManager.setPlayerControlsActive(false);
				GameManager.getTimeline().gameGUI.bottomGUIBar.continueTextObject.visible = true;
			}
			else if(currentMessageIndex == 36)
			{
				GameManager.setPlayerControlsActive(true);
				GameManager.getTimeline().gameGUI.bottomGUIBar.continueTextObject.visible = false;
				var p:PinkBall = new PinkBall();
				p.addToParent(GameManager.getTimeline());
				p.x = 750;
				p.y = 150;
			}
			else if(currentMessageIndex == 37)
			{
				GameManager.setPlayerControlsActive(false);
				GameManager.getTimeline().gameGUI.bottomGUIBar.continueTextObject.visible = true;
			}
			else if(currentMessageIndex == 47)
			{
				var  gr:GrayBall = new GrayBall(true);
				gr.x = 500;
				gr.y = 175;
				gr.addToParent(GameManager.getTimeline());
			}
			else if(currentMessageIndex == 49)
			{
				while(GameManager.getEnemyList().listSize()>0)
					GameManager.getEnemyList().getObject(0).removeFromStage();
			}
			else if(currentMessageIndex == 51)
			{
				var p4:PointerArrow = new PointerArrow(40,200,3);
				p4.addToParent(GameManager.getTimeline());
			}
			else if(currentMessageIndex == 52)
			{
				removeArrowsFromStage();
			}
			else if(currentMessageIndex == 56)
			{
				if(!CanvasManager.secondCanvasIsUnlocked())
				{
					GameManager.setPlayerControlsActive(true);
					GameManager.getTimeline().gameGUI.bottomGUIBar.continueTextObject.visible = false;
					var c:Canvas = new Canvas(700,150,2);
					c.addToParent(GameManager.getTimeline());
				}
			}
			else if(currentMessageIndex == 57)
			{
				GameManager.getTimeline().gameGUI.bottomGUIBar.continueTextObject.visible = false;
				var ch:Checkmark = new Checkmark();
				ch.addToParent(GameManager.getTimeline());
			}
		}
		private static function removeArrowsFromStage():void
		{
			for(var i = 0;i<GameManager.getMiscList().listSize();i++)
			{
				var m:Entity = (GameManager.getMiscList().getObject(i) as Entity);
				if(m is PointerArrow)
					m.removeFromStage();
			}
		}
	}
}