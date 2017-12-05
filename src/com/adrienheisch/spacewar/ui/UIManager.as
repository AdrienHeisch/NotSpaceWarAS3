package com.adrienheisch.spacewar.ui
{
	import com.adrienheisch.spacewar.Main;
	import com.adrienheisch.spacewar.ui.menus.ChooseNPlayersScreen;
	import com.adrienheisch.spacewar.ui.menus.ChooseNShipsScreen;
	import com.adrienheisch.spacewar.ui.menus.MainMenu;
	import com.isartdigital.utils.Stats;
	import flash.display.Stage;
	
	/**
	 * ...
	 * @author Adrien Heisch
	 */
	public class UIManager
	{
		protected static var stage:Stage;
		
		public static function init():void
		{
			stage = Main.instance.stage;
			
			stage.addChild(UIContainer.instance);
			
			var lStats:Stats = new Stats();
			lStats.visible = false;
			UIContainer.instance.addChild(lStats);
			
			mainMenu();
		}
		
		public static function mainMenu():void
		{
			UIContainer.instance.addChild(MainMenu.instance);
		}
		
		public static function chooseNShips():void
		{
			UIContainer.instance.addChild(ChooseNShipsScreen.instance);
		}
		
		public static function chooseNPlayers():void
		{
			UIContainer.instance.addChild(ChooseNPlayersScreen.instance);
		}
		
		public static function startGame():void
		{
			if (Hud.instance != null) Hud.instance.destroy();
			UIContainer.instance.addChild(Hud.instance);
		}
		
		public static function gameOver():void
		{
			UIContainer.instance.addChild(GameOverScreen.instance);
		}
		
		public static function stop():void
		{
			UIContainer.instance.destroy();
			stage = null;
		}
	
	}

}