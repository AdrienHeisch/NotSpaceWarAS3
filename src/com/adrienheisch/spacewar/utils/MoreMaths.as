package com.adrienheisch.spacewar.utils 
{
	import flash.geom.Point;
	/**
	 * ...
	 * @author Adrien Heisch
	 */
	public class MoreMaths 
	{
		public static const RAD2DEG: Number = 180 / Math.PI;
		public static const DEG2RAD: Number = Math.PI / 180;
		
		public static function distanceBetweenPoints(pX1: Number, pY1: Number, pX2: Number, pY2: Number): Number {
			return Math.sqrt(Math.pow(pX1 - pX2, 2) + Math.pow(pY1 - pY2, 2));
		}
		
		public static function angleDifference(pAngleA: Number, pAngleB: Number): Number {
			pAngleA *= DEG2RAD;
			pAngleB *= DEG2RAD;
			var lDifference = Math.atan2(Math.sin(pAngleA - pAngleB), Math.cos(pAngleA - pAngleB)) * RAD2DEG;
			return lDifference;
		}
		
	}

}