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