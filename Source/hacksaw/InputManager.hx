package hacksaw;

import flash.ui.Keyboard;
import flash.events.KeyboardEvent;
import flash.events.Event;
import flash.Lib;

class InputManager
{
	// ---------------------------------------------------------------------------
	// SINGLETON
	// ---------------------------------------------------------------------------

	// protected constructor

	private function new()
	{
		// initialise empty set of input statesByCode
		statesByCode = new Map<Int, InputState>();
		codesByName = new Map<String, Int>();
		
		// register events
		Lib.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, function(event : KeyboardEvent) return onKey(true, event));
		Lib.current.stage.addEventListener(KeyboardEvent.KEY_UP, function(event : KeyboardEvent) return onKey(false, event));
		Lib.current.stage.addEventListener(Event.ENTER_FRAME, onFrameEnter);
	}

	private static var instance : InputManager;

	private static function get()
	{
		if(instance == null)
			instance = new InputManager();
		return instance;
	}

	// shortcut static functions
	
	public static function addInput(name : String, code : Int)
	{
		get().__addInput(name, code);
	}

	public static function getState(name : String) : InputState
	{
		return get().__getState(name);
	}
	
	// ---------------------------------------------------------------------------
	// INPUT statesByCode
	// ---------------------------------------------------------------------------
	
	private var statesByCode : Map<Int, InputState>;
	private var codesByName : Map<String, Int>;
	
	// ---------------------------------------------------------------------------
	// EVENTS
	// ---------------------------------------------------------------------------
	
	private function onKey(pressed : Bool, event : KeyboardEvent)
	{
		var state = statesByCode.get(event.keyCode);
		if (state != null)
			state.pressed = pressed;
	}
	
	private function onFrameEnter(event : Event)
	{
		for (state in statesByCode)
			state.onFrameEnter(event);
	}
	
	
	// ---------------------------------------------------------------------------
	// REGISTER AND READ INPUT
	// ---------------------------------------------------------------------------
	
	private function __addInput(name : String, code : Int)
	{
		codesByName.set(name, code);
		statesByCode.set(code, new InputState());
	}

	private function __getState(name : String) : InputState
	{
		var code = codesByName.get(name);
		if (code == null)
			throw ("invalid input name '" + name + "'");

		return statesByCode.get(code);
	}
	
}