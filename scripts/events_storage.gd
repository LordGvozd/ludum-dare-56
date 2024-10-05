extends Node

static var file_name = "user://events.json"
static var default_events = ["start", ]


func load_events() -> Array:
	if not FileAccess.file_exists(file_name):
		return default_events
		
	var events_string = FileAccess.get_file_as_string(file_name)
	var events_json = JSON.parse_string(events_string)

	return events_json
	

func add_event(event: String) -> void:
	var events = load_events()
	
	if event in events:
		return
		
	events.append(event)
	
	var events_string = JSON.stringify(events)
	
	var events_file = FileAccess.open(file_name, FileAccess.WRITE)
	
	events_file.store_string(events_string)
	

func clear_events() -> void:
	var events_file = FileAccess.open(file_name, FileAccess.WRITE)
	
	events_file.store_string(JSON.stringify(default_events))
