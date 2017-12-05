package com.adrienheisch.spacewar.game
{
	import com.adrienheisch.utils.MoreMaths;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Adrien Heisch
	 */
	public class AIShip extends Ship
	{
		public static var movePrediction: Boolean = true;
		public static var shootPrediction: Boolean = true;
		
		protected static const DISTANCE_BEFORE_ACCELERATION:Number = 300;
		
		protected var target:Ship;
		
		public function AIShip()
		{
			super();
		}
		
		override public function gameLoop():void
		{
			var lLength = list.length;
			if (lLength > 1)
			{
				var lShip:Ship;
				var lDistances:Vector.<Number> = new Vector.<Number>(lLength, true);
				var lSortedDistances:Array = [];
				
				for (var i = lLength - 1; i >= 0; i--)
				{
					lShip = list[i];
					if (movePrediction) lDistances[i] = MoreMaths.distanceBetweenPoints(x, y, lShip.x + (lShip.velocity.x * MoreMaths.distanceBetweenPoints(x, y, lShip.x, lShip.y) / Bullet.SPEED), lShip.y + (lShip.velocity.y * MoreMaths.distanceBetweenPoints(x, y, lShip.x, lShip.y) / Bullet.SPEED));
					else lDistances[i] = MoreMaths.distanceBetweenPoints(x, y, lShip.x, lShip.y);
					lSortedDistances[i] = lDistances[i];
				}
				
				lSortedDistances.sort();
				
				target = list[lDistances.indexOf(lSortedDistances[1])];
				var lDistanceToTarget:Number = lSortedDistances[1];
				
				var lAngle:Number;
				if (shootPrediction)
				{
					var lFutureTargetPosition:Point = new Point(target.x + (target.velocity.x * lDistanceToTarget / Bullet.SPEED), target.y + (target.velocity.y * lDistanceToTarget / Bullet.SPEED));
					lAngle = Math.atan2(lFutureTargetPosition.y - y, lFutureTargetPosition.x - x) * MoreMaths.RAD2DEG;
				}
				else lAngle = Math.atan2(target.y - y, target.x - x) * MoreMaths.RAD2DEG;
				
				var lAngleDelta = MoreMaths.angleDifference(lAngle, rotation);
				
				input[2] = true;
				
				if (lAngleDelta < 0)
				{
					input[1] = false;
					input[0] = true;
				}
				if (lAngleDelta > 0)
				{
					input[0] = false;
					input[1] = true;
				}
				
				if (lAngleDelta > -45 && lAngleDelta < 15)
				{
					if (lDistanceToTarget > DISTANCE_BEFORE_ACCELERATION) input[4] = true;
					else input[4] = false;
					input[5] = true;
				}
				else
				{
					input[5] = false;
				}
			}
			else
			{
				for (var j = input.length - 1; j >= 0; j--)
					input[j] = false;
			}
			
			super.gameLoop();
		}
		
		override public function destroy():void
		{
			super.destroy();
		}
	
	}

}