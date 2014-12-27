package
{	
	import flash.events.Event;
	import flash.display.Bitmap;

	public class Canvas extends PowerUp
	{
		private var canvasID:Number;
		
		public function Canvas(xpos:Number,ypos:Number,id:Number,c:Boolean = false)
		{
			super(xpos,ypos);
			xVelocity  = 2;
			canvasID = id;
			hitRadius = 24.5;
			disappears = false;
		}
		public override function getClone():Entity
		{
			return new Canvas(x,y,canvasID,true);
		}
		public function getBitmapFromCanvasID(id:Number):Bitmap
		{
			if(id == 1)
				return new Bitmap(new DefaultCanvas());
			else if(id == 2)
				return new Bitmap(new MatrigonyLogo());
			else if(id == 3)
				return new Bitmap(new SkullCanvas());
			else if(id == 4)
				return new Bitmap(new HeartCanvas());
			else if(id == 5)
				return new Bitmap(new SuperPooperBrosCanvas());
			else if(id == 6)
				return new Bitmap(new AnnasCanvas());
			else if(id == 7)
				return new Bitmap(new SandCanvas());
			else if(id == 8)
				return new Bitmap(new DreamCanvas());
			else if(id == 9)
				return new Bitmap(new NightmareCanvas());
			else if(id == 10)
				return new Bitmap(new CityCanvas());
			else if(id == 11)
				return new Bitmap(new GlitchCanvas());
			else if(id == 12)
				return new Bitmap(new ChaosCanvas());
			else if(id == 13)
				return new Bitmap(new WaterCanvas());
			else if(id == 14)
				return new Bitmap(new PaintapedeCanvas());
			else if(id == 15)
				return new Bitmap(new CutsceneCanvas());
			return null;
		}
		public function getStringFromCanvasID(id:Number):String
		{
			if(id == 1)
				return "Default Canvas";
			else if(id == 2)
				return "Matrigony Logo";
			else if(id == 3)
				return "Dark Hills";
			else if(id == 4)
				return "Love";
			else if(id == 5)
				return "Super Pooper Bros (Youtube)";
			else if(id == 6)
				return "Blazing Stars";
			else if(id == 7)
				return "Colorful Sands";
			else if(id == 8)
				return "The Dream";
			else if(id == 9)
				return "The Nightmare";
			else if(id == 10)
				return "City Pride";
			else if(id == 11)
				return "Glitch";
			else if(id == 12)
				return "Chaotic Shadow";
			else if(id == 13)
				return "Deep Sea";
			else if(id == 14)
				return "Paintapede Portrait";
			else if(id == 15)
				return "Artist's Masterpiece";
			return "";
		}
		public override function updateTimedVariables(evt:Event):void
		{
			super.updateTimedVariables(evt);
			if(!GameManager.gameIsPaused())
			{
				if(x>-100)
				moveLeft();
				else
				{
					if(GameManager.getGameMode() == 0)
					{
						x = 700;
					}
					else
						removeFromStage();
				}
			}
		}
		public override function useEffectOn(p:PlayerBall):void
		{
			
			if(canvasID != 9)
				AudioManager.playAudio(AudioManager.getNewCanvasSound());
			else
				AudioManager.playAudio(AudioManager.getNightmareCanvasSound());
				
			var n:NewCanvasMenu = new NewCanvasMenu(getBitmapFromCanvasID(canvasID),getStringFromCanvasID(canvasID));
			n.addToParent(GameManager.getTimeline());
			
			if(canvasID == 1)
				CanvasManager.unlockFirstCanvas();
			else if(canvasID == 2)
				CanvasManager.unlockSecondCanvas();
			else if(canvasID == 3)
				CanvasManager.unlockThirdCanvas();
			else if(canvasID == 4)
				CanvasManager.unlockFourthCanvas();
			else if(canvasID == 5)
				CanvasManager.unlockFifthCanvas();
			else if(canvasID == 6)
				CanvasManager.unlockSixthCanvas();
			else if(canvasID == 7)
				CanvasManager.unlockSeventhCanvas();
			else if(canvasID == 8)
				CanvasManager.unlockEighthCanvas();
			else if(canvasID == 9)
				CanvasManager.unlockNinethCanvas();
			else if(canvasID == 10)
				CanvasManager.unlockTenthCanvas();
			else if(canvasID == 11)
				CanvasManager.unlockEleventhCanvas();
			else if(canvasID == 12)
				CanvasManager.unlockTwelfthCanvas();
			else if(canvasID == 13)
				CanvasManager.unlockThirteenthCanvas();
			else if(canvasID == 14)
				CanvasManager.unlockFourteenthCanvas();
			else if(canvasID == 15)
				CanvasManager.unlockFifteenthCanvas();
				
			if(CanvasManager.getNumberOfCanvasesUnlocked() == 15)
				APIManager.submitCollectedAllCanvases();
				
			super.useEffectOn(p);
		}
		public override function attachBannerToEntity(e:Entity):void
		{
			banner = new CanvasBanner(e);
			banner.addToParent(GameManager.getTimeline());
		}
	}
}