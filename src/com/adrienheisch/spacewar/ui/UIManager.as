package com.adrienheisch.spacewar.ui 
{
	import com.adrienheisch.spacewar.Main;
	import com.adrienheisch.spacewar.game.Ship;
	import flash.display.Stage;
	import flash.utils.getQualifiedClassName;
	/**
	 * ...
	 * @author Adrien Heisch
	 */
	public class UIManager 
	{
		public static const INIT: uint = 0;
		public static const START_GAME: uint = 1;
		public static const GAME_OVER: uint = 2;
		
		protected static var stage: Stage;
		
		public static function init(): void {
			stage = Main.instance.stage;
			
			stage.addChild(UIContainer.instance);
			
			status = INIT;
		}
		
		public static function set status(pStatus: uint): void {
			if (pStatus == INIT) {
				
			}
			else if (pStatus == START_GAME) {
				
			}
			else if (pStatus == GAME_OVER) {
				UIContainer.instance.addChild(GameOverScreen.instance);
			}
			else throw new Error("This is not a correct status, please check the possible values at " + getQualifiedClassName(UIManager));
		}
		
	}

}