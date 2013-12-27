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
import flash.display.DisplayObject;
import flash.display.Shape;
import flash.events.MouseEvent;
import flash.geom.Point;

import hacksaw.Draw;
import hacksaw.Useful;

import model.Game;

class GameView extends Sprite
{
	private var map : Sprite;

	private var overlay : Sprite;

	public function new(g : Game)
	{
		super();

		// create graphical representations of territories
		addChild(map = new Sprite());
		for(column in g.territories) for(t in column)
			map.addChild(new TerritoryView(this, t));
		map.x = 100;
		map.y = 100;

		// overlay elements do not catch mouse events
		addChild(overlay = new Sprite());
		overlay.mouseEnabled = false;

		// create the selected agent outline
		selectedAgentOutline =
			Draw.strokeCircle(0, 0, 10, 0xFFFF00, 3.0);
		selectedAgentPath = new Shape();
	}



	// Select and move agents

	private var selectedAgent : AgentView;
	private var selectedAgentOutline : DisplayObject;
	private var selectedAgentPath : DisplayObject;

	private function __redrawAgentPath(_x, _y)
	{
		var agentPosition = selectedAgent.localToGlobal(Useful.ORIGIN);
		var d = Useful.normalise(_x - agentPosition.x, _y - agentPosition.y);

		selectedAgentPath.graphics.clear();
		if(d.originalNorm > 10)
		{
			selectedAgentPath.graphics.lineStyle(3, 0xFFFF00);
			selectedAgentPath.graphics.moveTo(agentPosition.x + d.x*10, agentPosition.y + d.y*10);
			selectedAgentPath.graphics.lineTo(_x, _y);
		}
	}

	public function pickAgent(a : AgentView)
	{
		if(a == null)
			removeChild(selectedAgentOutline);
		else
		{
			overlay.addChild(selectedAgentOutline);

			var agentPosition = a.localToGlobal(Useful.ORIGIN);
			selectedAgentOutline.x = agentPosition.x;
			selectedAgentOutline.y = agentPosition.y;

			overlay.addChild(selectedAgentPath);
			selectedAgentPath.graphics.clear();
		}
		selectedAgent = a;
	}

	public function dropAgent(t : TerritoryView)
	{
		if(selectedAgent != null)
		{
			// remember issued order
			if(selectedAgent.agent.canMoveTo(t.territory))
				trace("possible to move from " + selectedAgent.agent.territory + " to " + t.territory);
			else
				trace("NOT POSSIBLE TO MOVE FROM " + selectedAgent.agent.territory + " TO " + t.territory);

			// deselect agent
			overlay.removeChild(selectedAgentOutline);
			selectedAgent = null;
		}
		overlay.removeChild(selectedAgentPath);
	}

	public function moveAgent(_x : Int, _y : Int)
	{
		if(selectedAgent != null)
			__redrawAgentPath(_x, _y);
	}
}