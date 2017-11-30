package com.adrienheisch.spacewar.game
{
	import com.adrienheisch.spacewar.Main;
	import com.adrienheisch.spacewar.ui.UIManager;
	import flash.display.Stage;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Adrien Heisch
	 */
	public class GameManager
	{
		public static var nShips:uint = 2; // 2 - 4 ships
		public static var nPlayers:uint = 1; // 1 <= N_PLAYERS <= 2
		
		public static var aiMovePrediction:Boolean = true;
		public static var aiShootPrediction:Boolean = true;
		
		public static var shipMoveBackAllowed:Boolean = false;
		public static var shipAutoSlow:Boolean = true;
		
		protected static const GAMELOOP_CLASSES:Vector.<Class> = new <Class>[Ship, Bullet, Explosion];
		
		protected static const SHIPS_PER_LINE:uint = 2;
		
		protected static var stage:Stage;
		
		public static function init():void
		{
			stage = Main.instance.stage;
			
			stage.addChild(GameContainer.instance);
		}
		
		public static function startGame():void
		{
			stage.focus = stage;
			
			var lShip:Ship;
			for (var i = 0; i < nShips - nShips % SHIPS_PER_LINE; ++i)
			{
				GameContainer.instance.addChild(lShip = (nPlayers > i) ? new PlayerShip() : new AIShip());
				lShip.x = (SHIPS_PER_LINE * (i % SHIPS_PER_LINE) + 1) * stage.stageWidth / (2 + SHIPS_PER_LINE);
				lShip.y = (i - (i % SHIPS_PER_LINE) + 1) * stage.stageHeight / (nShips);
				lShip.rotation = (i % 2 == 0) ? 0 : 180;
			}
			if (nShips % 2 != 0)
			{
				GameContainer.instance.addChild(lShip = (nPlayers == nShips) ? new PlayerShip() : new AIShip());
				lShip.x = 1 * stage.stageWidth / 2;
				lShip.y = (nShips - 1) / SHIPS_PER_LINE * stage.stageHeight / (nShips / SHIPS_PER_LINE);
				lShip.rotation = -90;
			}
			
			UIManager.startGame();
			
			stage.addEventListener(Event.ENTER_FRAME, gameLoop);
		}
		
		protected static function gameLoop(pEvent:Event):void
		{
			var lClass:Class;
			for (var i = GAMELOOP_CLASSES.length - 1; i >= 0; i--)
			{
				lClass = GAMELOOP_CLASSES[i];
				for (var j = lClass.list.length - 1; j >= 0; j--)
				{
					lClass.list[j].gameLoop();
				}
			}
			
			if (Ship.list.length <= 1)
			{
				gameOver();
			}
			
			for (i = GameContainer.instance.numChildren - 1; i >= 0; i--)
			{
				GameContainer.instance.getChildAt(i).scaleX = 0.5;
				GameContainer.instance.getChildAt(i).scaleY = 0.5;
			}
		
		}
		
		protected static function gameOver()
		{
			UIManager.gameOver();
		}
		
		public static function destroyAllInstances():void
		{
			var lClass:Class;
			for (var i = GAMELOOP_CLASSES.length - 1; i >= 0; i--)
			{
				lClass = GAMELOOP_CLASSES[i];
				for (var j = lClass.list.length - 1; j >= 0; j--)
				{
					lClass.list[j].destroy();
				}
			}
		}
		
		public static function stop():void
		{
			stage.removeEventListener(Event.ENTER_FRAME, gameLoop);
			destroyAllInstances();
			GameContainer.instance.destroy();
			stage = null;
		}
	
	}

}