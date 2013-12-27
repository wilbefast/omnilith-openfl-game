package view;

import flash.display.Sprite;
import flash.display.DisplayObject;
import flash.events.MouseEvent;

import hacksaw.Draw;

import model.Territory;

class TerritoryView extends Sprite
{
	// Hexagon
	public static inline var HEX_RADIUS = 32;
	public static inline var HEX_HEIGHT = HEX_RADIUS;
	public static var HEX_WIDTH = Math.sqrt(3)/2 * HEX_HEIGHT;

	// Target
	public var territory(default, null) : Territory;

	// Container
	private var gameView : GameView;

	public function new(gv : GameView, t : Territory)
	{
		super();

		// remember the target
		territory = t;

		// remember the container
		gameView = gv;

		// calculate position
		x = (t.row + 2*t.column)*HEX_WIDTH;
		y = 2*(t.row*0.75*HEX_HEIGHT);

		// draw hexagon
		addChild(Draw.fillHexagon(0, 0, HEX_RADIUS, 0x00FF00));
		addChild(Draw.strokeHexagon(0, 0, HEX_RADIUS, 0x000000, 1.0));

		// draw agents 
		for(a in t.agents)
			addChild(new AgentView(gv, a));

		// register callbacks
		addEventListener(MouseEvent.MOUSE_UP, function(event) 
		{ 
			gameView.dropAgent(this);
			event.stopPropagation();
		});
		addEventListener(MouseEvent.MOUSE_MOVE, function(event) 
		{ 
			gameView.moveAgent(event.stageX, event.stageY);
		});
	}
}