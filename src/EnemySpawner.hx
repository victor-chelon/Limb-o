package;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.HXP;
import Enemy;
import EnemyState;


/**
 * ...
 * @author Etienne
 */

class EnemySpawner extends Entity
{

	public function new(_x : Int, _y : Int, _respawnTimer : Float, _spawnNumber : Int)
	{
		super(_x, _y, Image.createRect(32, 64, 0xFF99FD));
		
		layer = 50;
		spawn = _spawnNumber;
		
		respawnTimer = _respawnTimer;
		effectiveTimer = 0;
	}
	
	public override function update()
	{
		if (spawn > 0)
		{
			if (effectiveTimer > 0)
			{
				effectiveTimer -= HXP.elapsed;
			}
			else
			{
				spawn -= 1;
				HXP.scene.add(new Enemy(this, x, y, 30, 50, EnemyState.PATROL, 100));
				effectiveTimer = respawnTimer;
			}
		}
		
		super.update();
	}
	
	public function notifyEnemyDeath()
	{
		effectiveTimer = respawnTimer;
		spawn += 1;
	}
	
	private var respawnTimer : Float;
	private var effectiveTimer : Float;
	private var spawn : Int;
}