extends Area2D

@export_file(".json") var dialog_path: String
@export var _dialog_label: Label

var current_phrase: String

func _ready() -> void:
	#EventsStorage.clear_events()
	_load_dialog()
	

func _load_dialog() -> void:
	if not FileAccess.file_exists(dialog_path):
		current_phrase = ""
		
	var dialog_data_string = FileAccess.get_file_as_string(dialog_path)
	var dialog_json = JSON.parse_string(dialog_data_string)
	
	var dialog_events = dialog_json.keys()
	dialog_events.reverse()
	
	var events = EventsStorage.load_events()
	
	for event in dialog_events:
		if event in events:
			current_phrase = dialog_json[event]
			break
			


func _on_body_entered(body: Node2D) -> void:
	_load_dialog()
	_dialog_label.text = current_phrase
	


func _on_body_exited(body: Node2D) -> void:
	_dialog_label.text = ""
