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

enum Terrain
{
	PLAINS;
	HILLS;
	FOREST;
	MOUNTAIN;
	WATER;
	FORD;
}

class Territory
{
	// Terrain type

	public var terrain(default, null) : Terrain; // read-only


	// Agents

	public /* FIXME */ var agents : List<Agent>;


	// Grid position

	public var column(default, null) : Int; // read-only
	public var row(default, null) : Int;	// read-only


	// Constructor

	public function new(c : Int, r : Int)
	{
		// remember the row and column
		column = c;
		row = r;

		// set default terrain type
		terrain = Terrain.PLAINS;

		// no agents to begin with
		agents = new List<Agent>();

		// FIXME
		if(Math.random() < 0.1)
			agents.push(new Agent(this));
	}	


	// Adjacency

	public function isAdjacentTo(other : Territory) : Bool
	{
		// too far horizontally
		if( (column != other.column)
		&& ((column + 1)%Game.MAP_WIDTH != other.column)
		&& ((column - 1)%Game.MAP_WIDTH != other.column))
			return false;

		// too far vertically
		if( (row != other.row)
		&& ((row + 1)%Game.MAP_HEIGHT != other.row)
		&& ((row - 1)%Game.MAP_HEIGHT != other.row))
			return false;

		// North-west diagonal
		if(((row - 1)%Game.MAP_HEIGHT == other.row)
		&& (column - 1)%Game.MAP_WIDTH == other.column)
			return false;

		// South-east diagonal
		if(((row + 1)%Game.MAP_HEIGHT == other.row)
		&& (column + 1)%Game.MAP_WIDTH == other.column)
			return false;

		// all good
		return true;
	}

	// To string override for debugging

	public function toString() 
	{
		return "Territory(" + column + ", " + row + ")";
	}
}