package hacksaw;

import flash.display.Graphics;
import flash.display.Shape;

class Draw
{

	private function new() { }
	
	private static inline var CIRCLE_SEGMENTS_PER_RADIUS = 3;
	
	public static inline function strokeCircle(x : Float, y : Float, radius : Float, lineColour : Int = 0, 
		lineWidth : Float = 1.0 ) : Shape
	{
		var result = new Shape();
		result.graphics.lineStyle(lineWidth, lineColour);
		result.graphics.drawCircle(x, y, radius);
		return result;
	}

	public static inline function fillCircle(x : Float, y : Float, radius : Float, fillColour : Int = 0) : Shape
	{
		var result = new Shape();
		result.graphics.beginFill(fillColour);
		result.graphics.drawCircle(x, y, radius);
		result.graphics.endFill();
		return result;
	}

	private static inline function hexagon(s : Shape, x : Float, y : Float, radius : Float)
	{
		for (i in 0 ... 7)
		{
			var angle = 2 * Math.PI / 6 * (i + 0.5);
			var point_x = x + Math.cos(angle)* radius;
			var point_y = y + Math.sin(angle) * radius;
			if(i == 0)
				s.graphics.moveTo(point_x, point_y);
			else
				s.graphics.lineTo(point_x, point_y);
		}
	}

	public static inline function strokeHexagon(x : Float, y : Float, radius : Float, lineColour : Int = 0, 
		lineWidth : Float = 1.0) : Shape
	{
		var result = new Shape();
		result.graphics.lineStyle(lineWidth, lineColour);
		hexagon(result, x, y, radius);
		return result;
	}

	public static inline function fillHexagon(x : Float, y : Float, radius : Float, fillColour : Int = 0) : Shape
	{
		var result = new Shape();
		result.graphics.beginFill(fillColour);
		hexagon(result, x, y, radius);
		result.graphics.endFill();
		return result;
	}
}