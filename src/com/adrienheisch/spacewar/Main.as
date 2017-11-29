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
		
		protected static var _instance:Main;
		
		public static function get instance():Main
		{
			return _instance;
		}
		
		public function Main()
		{
			super();
			
			_instance = this;
			
			KeyboardManager.init();
			
			BackgroundManager.init();
			GameManager.init();
			UIManager.init();
		}
	
	}

}