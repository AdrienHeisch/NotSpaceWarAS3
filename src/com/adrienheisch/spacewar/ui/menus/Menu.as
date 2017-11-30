package com.adrienheisch.spacewar.ui.menus
{
	import com.adrienheisch.spacewar.ui.buttons.CustomButton;
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author Adrien Heisch
	 */
	public class Menu extends MovieClip
	{
		
		public function Menu()
		{
			super();
		}
		
		public function destroy():void
		{
			for (var i = CustomButton.list.length - 1; i >= 0; i--)
			{
				CustomButton.list[i].destroy();
			}
			if (parent != null) parent.removeChild(this);
		}
	
	}

}