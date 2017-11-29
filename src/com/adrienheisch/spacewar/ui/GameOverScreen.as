package com.adrienheisch.spacewar.ui
{
	
	import com.adrienheisch.spacewar.Main;
	import com.adrienheisch.spacewar.game.GameManager;
	import com.adrienheisch.spacewar.game.Ship;
	import com.adrienheisch.spacewar.utils.KeyboardManager;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.ui.Keyboard;
	
	/**
	 * ...
	 * @author Adrien Heisch
	 */
	public class GameOverScreen extends MovieClip
	{
		
		/**
		 * instance unique de la classe GameOverScreen
		 */
		protected static var _instance:GameOverScreen;
		
		/**
		 * Retourne l'instance unique de la classe, et la crée si elle n'existait pas au préalable
		 * @return instance unique
		 */
		public static function get instance():GameOverScreen
		{
			if (_instance == null) _instance = new GameOverScreen();
			return _instance;
		}
		
		public var txtWinner:TextField;
		
		public function GameOverScreen()
		{
			super();
			
			if (_instance != null) throw new Error(this + "is a Singleton, please use GameOverScreen.instance");
			else
			{
				_instance = this;
				
				txtWinner.text = Ship.list.length > 0 ? "WINNER : P" + Ship.list[0].id : "DRAW";
				Main.instance.stage.addEventListener(Event.ENTER_FRAME, restart);
			}
		}
		
		protected function restart(pEvent:Event):void
		{
			if (KeyboardManager.keys.indexOf(Keyboard.SPACE) >= 0)
			{
				GameManager.destroyAllInstances();
				GameManager.startGame();
				
				destroy();
			}
		}
		
		/**
		 * détruit l'instance unique et met sa référence interne à null
		 */
		public function destroy():void
		{
			Main.instance.stage.removeEventListener(Event.ENTER_FRAME, restart);
			_instance = null;
			if (parent != null) parent.removeChild(this);
		}
	
	}

}