package com.adrienheisch.spacewar.ui.buttons
{
	
	import com.adrienheisch.spacewar.ui.buttons.CustomButton;
	import com.adrienheisch.spacewar.ui.menus.NumberChoiceMenu;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Adrien Heisch
	 */
	public class NumberButton extends CustomButton
	{
		public var index:int;
		
		public function NumberButton()
		{
			super();
			
			if (name != null) index = int(name.substr(-1));
			else
			{
				index = list.indexOf(this) + 1;
				throw new Error(this + " should have an instance name (mcButton + int).");
			}
			
			txtDisplay.text = String(index);
		}
		
		override protected function onClick(pEvent:Event):void
		{
			NumberChoiceMenu(parent).buttonClicked(index);
		}
	
	}

}