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


package model;

class Game
{
	// Matrix of territories

	public static inline var MAP_WIDTH : Int = 5;
	public static inline var MAP_HEIGHT : Int = 5;

	public /* FIXME */ var territories : Array<Array<Territory>>;


	// List of players and spectators

	private var players : Array<Player>;


	public function new()
	{
		// create territories
		territories = new Array<Array<Territory>>();
		for(col in 0 ... MAP_WIDTH)
		{
			territories[col] = new Array<Territory>();
			for(row in 0 ... MAP_HEIGHT)
				territories[col][row] = new Territory(col, row);
		}
	}
}