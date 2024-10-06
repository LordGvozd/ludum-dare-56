extends Area2D

@export_file(".json") var dialog_path: String
@export var _dialog_label: Label

var current_phrase: String

func _ready() -> void:
	#EventsStorage.clear_events()
	_load_dialog()
	

func _load_dialog() -> void:
	if not FileAccess.file_exists(dialog_path):
		printerr("File '" + dialog_path + "' not exist!")
		current_phrase = ""
		return
		
	var dialog_data_string = FileAccess.get_file_as_string(dialog_path)
	var dialog_json = JSON.parse_string(dialog_data_string)
	
	var dialog_events = dialog_json.keys()
	dialog_events.reverse()
	
	
	var events = EventsStorage.load_events()
	
	for event in dialog_events:
		if event in events:
			var pharse = dialog_json[event]
			
			if pharse is String:
				current_phrase = pharse
			elif pharse is Array:
				current_phrase = pharse[randi() % pharse.size()]
			
			break
			


func _on_body_entered(_body: Node2D) -> void:
	if _body is PlayerMovement:
		_load_dialog()
		_dialog_label.text = current_phrase
	

func _on_body_exited(_body: Node2D) -> void:
	if _body is PlayerMovement:
		_dialog_label.text = ""
