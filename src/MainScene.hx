import com.haxepunk.HXP;
import com.haxepunk.Scene;
import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.utils.Draw;
import Enemy;
import Parsing;

class MainScene extends Scene
{
	public function new()
    {
        super();
    }
	
	public override function begin()
	{
		add(new Player(HXP.screen.width / 2, HXP.screen.height - 400));
		//add(new Test(HXP.screen.width / 2, HXP.screen.height - 300));

		/*
		var i:Int = 0;
		var u:Int = 0;
		
		while (i < 632)
		{
			add(new SolidBlock(i, 400));
			i += 32;
		}
		
		while (u < 400)
		{
			add(new SolidBlock(0, u));
			add(new SolidBlock(600, u));
			u += 32;
		}
		*/

		Parsing.createBlock(this);
		//add(new Enemy(HXP.screen.width / 2, HXP.screen.height / 2, Image.createRect(50, 100, 0xFF0000), EnemyState.PATROL));
	}
	
	
	override public function render():Void
	{
		super.render();
		
		var entities:Array<Entity> = [];
		getAll(entities);
		
		for (entity in entities)
		{
			trace("entity name : " + entity.name);
			Draw.hitbox(entity, true, 0x00FF00, 1);
		}

	}
}