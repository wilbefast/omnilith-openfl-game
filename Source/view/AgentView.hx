/* 
'Omnilith' a simultaneous asynchronus turn-based strategy game
(C) Copyright 2013 William Dyce

All rights reserved. This program and the accompanying materials
are made available under the terms of the GNU Lesser General Public License
(LGPL) version 3 which accompanies this distribution, and is available at
http://www.gnu.org/licenses/lgpl.html

This library is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
Lesser General Public License for more details.
*/


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