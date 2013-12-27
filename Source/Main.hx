import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Sprite;
import openfl.Assets;

import view.GameView;

import model.Game;

class Main extends Sprite 
{
	public function new () 
	{
		
		super ();

		addChild(new GameView(new Game()));
	}
}