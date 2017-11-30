package com.adrienheisch.spacewar.ui
{
	import com.adrienheisch.spacewar.game.Ship;
	import flash.display.MovieClip;
	import flash.geom.ColorTransform;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author Adrien Heisch
	 */
	public class HealthBar extends MovieClip
	{
		public static var list:Vector.<HealthBar> = new Vector.<HealthBar>();
		
		public static var a:uint = 0;
		
		protected var ship:Ship;
		protected var initMaskWidth:Number;
		
		public var mcFill:MovieClip;
		public var mcMask:MovieClip;
		public var txtInfo: TextField;
		
		public function HealthBar()
		{
			super();
			
			list.push(this);
			
			initMaskWidth = mcMask.width;
		}
		
		public function set index(pIndex: uint): void {
			ship = Ship.list[pIndex];
			var lColorTransform:ColorTransform = new ColorTransform();
			lColorTransform.color = Ship.COLORS[pIndex];
			mcFill.transform.colorTransform = lColorTransform;
			
			refresh();
		}
		
		public function refresh():void
		{
			if (ship != null) {
				mcMask.width = initMaskWidth * ship.health / Ship.MAX_HEALTH;
				txtInfo.text = Ship.infoList[ship.id][0] + " wins, " + Ship.infoList[ship.id][1] + " kills, " + Ship.infoList[ship.id][2] + " damage";
			}
			else throw new Error(this + " has no corresponding ship !");
		}
		
		public function destroy():void
		{
			list.splice(list.indexOf(this), 1);
			if (parent != null) parent.removeChild(this);
		}
	
	}

}