package com.adrienheisch.spacewar.ui.menus 
{
	import com.adrienheisch.spacewar.ui.buttons.PlayButton;
	
	
	/**
	 * ...
	 * @author Adrien Heisch
	 */
	public class MainMenu extends Menu 
	{

		/**
		 * instance unique de la classe MainMenu
		 */
		protected static var _instance: MainMenu;
		
		/**
		 * Retourne l'instance unique de la classe, et la crée si elle n'existait pas au préalable
		 * @return instance unique
		 */
		public static function get instance (): MainMenu {
			if (_instance == null) _instance = new MainMenu();
			return _instance;
		}
		
		public var mcPlay: PlayButton;
		public var mcOptions: PlayButton;
	
		public function MainMenu() 
		{
			super();
			
			if (_instance != null) throw new Error(this + "is a Singleton, please use MainMenu.instance");
			else {
				_instance = this;
			}
		}
		
		/**
		 * détruit l'instance unique et met sa référence interne à null
		 */
		override public function destroy(): void {
			_instance = null;
			super.destroy();
		}

	}
	
}