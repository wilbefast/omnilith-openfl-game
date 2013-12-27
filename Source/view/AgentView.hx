package view;

import flash.display.Sprite;
import flash.events.MouseEvent;

import hacksaw.Draw;

import model.Agent;

class AgentView extends Sprite
{
	// Target
	public var agent(default, null) : Agent; // read-only

	// Container
	private var gameView : GameView;

	public function new(gv : GameView, a : Agent)
	{
		super();

		// remember the target
		agent = a;

		// remember the container
		gameView = gv;

		addChild(Draw.fillCircle(0, 0, 10));

		// register callbacks
		addEventListener(MouseEvent.MOUSE_DOWN, function(event) 
		{ 
			gameView.pickAgent(this);
			event.stopPropagation();
		});
	}
}