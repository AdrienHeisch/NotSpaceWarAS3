package com.adrienheisch.spacewar
{
	import com.adrienheisch.spacewar.background.BackgroundManager;
	import com.adrienheisch.spacewar.game.GameManager;
	import com.adrienheisch.spacewar.ui.UIManager;
	import com.adrienheisch.spacewar.utils.KeyboardManager;
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author Adrien Heisch
	 */
	public class Main extends MovieClip
	{
		protected static const MANAGERS: Vector.<Class> = new <Class> [KeyboardManager, BackgroundManager, GameManager, UIManager]; //the order matters !
		
		protected static var _instance:Main;
		
		public static function get instance():Main
		{
			return _instance;
		}
		
		public function Main()
		{
			super();
			
			_instance = this;
			
			initApp();
		}
		
		public function initApp(): void {
			for (var i = 0; i < MANAGERS.length; i++)
			{
				MANAGERS[i].init();
			}
		}
		
		public function restartApp(): void {
			for (var i = 0; i < MANAGERS.length; i++)
			{
				MANAGERS[i].stop();
			}
			
			initApp();
		}
	
	}

}