extends Node

static var file_name = "user://events.json"
static var default_events = ["start"]

var _callbacks = []
var _events = []

func register_event_change_callback(callback: Callable) -> void:
	_callbacks.append(callback)

func load_events() -> Array:
	if  _events:
		return _events

	if not FileAccess.file_exists(file_name):
		_events = default_events
		return default_events
		
	var events_string = FileAccess.get_file_as_string(file_name)
	
	if not events_string:
		return default_events
	
	var events_json = JSON.parse_string(events_string)
	
	_events = events_json
	return _events
	

func add_event(event: String) -> void:
	print("ADd")
	var events = load_events()
	
	if event in events:
		return
		
	events.append(event)
	
	var events_string = JSON.stringify(events)
	

	
	var events_file = FileAccess.open(file_name, FileAccess.WRITE)
	
	events_file.store_string(events_string)
	_events = events
	
	_run_callbacks()
	
func _run_callbacks():
	# Run all callbacks
	for clb: Callable in _callbacks:
		if clb.get_object():
			clb.call()
		
																							   
		
	
func clear_events() -> void:
	var events_file = FileAccess.open(file_name, FileAccess.WRITE)
	_events = default_events
	
	events_file.store_string(JSON.stringify(default_events))
