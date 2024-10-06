extends Control

@export var task_text_label: Label
@export_file(".json") var  tasks_file: String

func _ready() -> void:
	task_text_label.text = "Current Task:\n"
	
	#EventsStorage.clear_events()
	EventsStorage.register_event_change_callback(Callable(self, "on_event_changed"))
	
	_set_task()
		
func _set_task():
	var tasks = _load_tasks()
	var tasks_events = tasks.keys()
	tasks_events.reverse()
	
	var events = EventsStorage.load_events()
	
	for event in tasks_events:
		if event in events:
			task_text_label.text += "\n" + tasks[event] 
			break
	

func _load_tasks() -> Dictionary:
	var tasks_string = FileAccess.get_file_as_string(tasks_file)
	var tasks = JSON.parse_string(tasks_string)
	
	
	return tasks
	

func on_event_changed():
	_set_task()
