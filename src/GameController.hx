import com.haxepunk.HXP;
import com.haxepunk.Entity;
import com.haxepunk.Scene;
import com.haxepunk.Tween;
import com.haxepunk.graphics.Text;
import com.haxepunk.tweens.misc.Alarm;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;

import Player;

class GameController
{

	public function new()
	{
		HXP.scene = new MenuScene();
	}

	
	static public function startGame():Void
	{
		if (!_inGame) _inGame = true;
		HXP.scene.removeAll();
		HXP.scene = new MainScene();
	}
	
	
	static public function clean()
	{
		HXP.scene.removeAll();
	}
	
	
	static public function playerJustDied(e:Entity):Void
	{
		if (e.type == "player")
		{
			HXP.scene.addGraphic(new Text("You are so bad ! You died !", e.x, e.y - 40, 0, 0));
		}
		else if (e.type == "enemy")
		{
			HXP.scene.addGraphic(new Text("I'll have you know that I just killed you.", e.x - 100, e.y - 80, 0, 0));
		}
		
		HXP.scene.addTween(new Alarm(2., function (e:Dynamic) {
			startGame();
		}, TweenType.OneShot), true);
	}
	
	
	static public function isPlayerAlive():Bool
	{
		if (HXP.scene.getInstance("player") == null)
		{
			return false;
		}
		return true;
	}
	
	public function update():Void
	{
		if (Input.pressed(Key.P))
		{
			clean();
			startGame();
		}
	}
	
	static private var _inGame:Bool = false;
}