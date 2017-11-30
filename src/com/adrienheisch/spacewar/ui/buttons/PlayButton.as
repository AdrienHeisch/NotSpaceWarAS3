package com.adrienheisch.spacewar.ui.buttons 
{
	
	import com.adrienheisch.spacewar.ui.UIManager;
	import com.adrienheisch.spacewar.ui.buttons.CustomButton;
	import com.adrienheisch.spacewar.ui.menus.Menu;
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author Adrien Heisch
	 */
	public class PlayButton extends CustomButton 
	{
		public var index: int;
		
		public function PlayButton() 
		{
			super();
			
		}
		
		override protected function onClick(pEvent:Event): void {
			Menu(parent).destroy();
			UIManager.chooseNShips();
		}

	}
	
}