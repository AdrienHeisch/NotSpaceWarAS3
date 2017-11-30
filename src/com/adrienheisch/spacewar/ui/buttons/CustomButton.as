package com.adrienheisch.spacewar.ui.buttons
{
	
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author Adrien Heisch
	 */
	public class CustomButton extends MovieClip
	{
		public static var list:Vector.<CustomButton> = new Vector.<CustomButton>();
		
		public var txtDisplay:TextField;
		public var btnMenu:SimpleButton;
		
		public function CustomButton()
		{
			super();
			
			list.push(this);
			
			stop();
			
			txtDisplay.mouseEnabled = false;
			
			btnMenu.addEventListener(MouseEvent.CLICK, onClick);
		}
		
		protected function onClick(pEvent:Event):void
		{
			btnMenu.removeEventListener(MouseEvent.CLICK, onClick);
		}
		
		public function destroy():void
		{
			list.splice(list.indexOf(this), 1);
			if (parent != null) parent.removeChild(this);
		}
	
	}

}