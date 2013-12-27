package hacksaw;
import flash.events.Event;

class InputState
{
	private var pressed_previously = false;
	
	public var trigger(default, null) = 0;
	private function recalculate_trigger()
	{
		if (pressed_previously && !pressed)
			trigger = -1;
		else if (pressed && !pressed_previously)
			trigger = 1;
		else
			trigger = 0;
	}
	
	private var __pressed = false;
	public var pressed(default, set) = false;
	private function set_pressed(pressed_next : Bool) : Bool
	{
		pressed_previously = pressed;
		pressed = pressed_next;

		recalculate_trigger();

		return pressed;
	}
	
	public function new()
	{
		
	}
	
	public function onFrameEnter(event : Event)
	{
		pressed_previously = pressed;
		
		recalculate_trigger();
	}
}