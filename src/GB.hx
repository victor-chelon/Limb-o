package src;

import hxmath.math.Vector2;

/**
 * ...
 * @author ...
 */
class GB
{

	public function new()
	{	
	}
	
	// PLAYER RELATED
	static public var playerReach:Float = 9.5;
	static public var playerSpeed:Float	= 4.;
	
	static public var playerArmCount:Int = 2;
	static public var playerLegCount:Int = 2;
	
	// GAME RELATED
	static public var gravity:Vector2 	= new Vector2(0., 20.);
	
}