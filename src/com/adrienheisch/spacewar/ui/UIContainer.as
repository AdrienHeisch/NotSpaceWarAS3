package com.adrienheisch.spacewar.ui 
{
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Adrien Heisch
	 */
	public class UIContainer extends MovieClip 
	{

		/**
		 * instance unique de la classe UIContainer
		 */
		protected static var _instance: UIContainer;
		
		/**
		 * Retourne l'instance unique de la classe, et la crée si elle n'existait pas au préalable
		 * @return instance unique
		 */
		public static function get instance (): UIContainer {
			if (_instance == null) _instance = new UIContainer();
			return _instance;
		}
	
		public function UIContainer() 
		{
			super();
			
			if (_instance != null) throw new Error(this + "is a Singleton, please use UIContainer.instance");
			else {
				_instance = this;
			}
		}
		
		/**
		 * détruit l'instance unique et met sa référence interne à null
		 */
		public function destroy (): void {
			_instance = null;
			if (parent != null) parent.removeChild(this);
		}

	}
	
}