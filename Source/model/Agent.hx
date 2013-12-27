package model;

class Agent
{
	// Currently occupied territory

	public var territory(default, null) : Territory; // read-only


	// Constructor

	public function new(t : Territory)
	{
		territory = t;
	}


	// Pathing

	public function canMoveTo(t : Territory) : Bool
	{
		return (territory.isAdjacentTo(t));
	}
}