package com.adrienheisch.spacewar.ui
{
	import com.adrienheisch.spacewar.Main;
	import com.adrienheisch.spacewar.game.Ship;
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Adrien Heisch
	 */
	public class Hud extends MovieClip
	{
		
		/**
		 * instance unique de la classe Hud
		 */
		protected static var _instance:Hud;
		
		/**
		 * Retourne l'instance unique de la classe, et la crée si elle n'existait pas au préalable
		 * @return instance unique
		 */
		public static function get instance():Hud
		{
			if (_instance == null) _instance = new Hud();
			return _instance;
		}
		
		public function Hud()
		{
			super();
			
			if (_instance != null) throw new Error(this + "is a Singleton, please use Hud.instance");
			else
			{
				_instance = this;
				
				for (var i = Ship.list.length - 1; i >= 0; i--) {
					var lBar: HealthBar;
					addChild(lBar = new HealthBar());
					lBar.x = (i % 2 == 0) ? 10 : Main.instance.stage.stageWidth - lBar.width - 10;;
					lBar.y = (Math.floor(i / 2) % 2 == 0) ? 10 : Main.instance.stage.stageHeight - lBar.height - 10;;
					lBar.index = i;
				}
				
				addEventListener(Event.ENTER_FRAME, refreshAlpha);
			}
		}
		
		protected function refreshAlpha(pEvent: Event): void {
			var lChild: DisplayObject;
			for (var i = numChildren - 1; i >= 0; i--) {
				lChild = getChildAt(i);
				for (var j = Ship.list.length - 1; j >= 0; j--) {
					if (lChild.hitTestObject(Ship.list[j])) {
						lChild.alpha = 0.5;
						break;
					}
					else lChild.alpha = 1;
				}
			}
		}
		
		public function refreshInfo(): void {
			for (var i = HealthBar.list.length - 1; i >= 0; i--) {
				HealthBar.list[i].refresh();
			}
		}
		
		/**
		 * détruit l'instance unique et met sa référence interne à null
		 */
		public function destroy():void
		{
			_instance = null;
			for (var i = HealthBar.list.length - 1; i >= 0; i--) {
				HealthBar.list[i].destroy();
			}
			if (parent != null) parent.removeChild(this);
		}
	
	}

}