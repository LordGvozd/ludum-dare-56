extends Area2D
class_name NoteDisplay

@export var note_ui_container: Container
@export var note_text: Label
@export var promt_label: Label

var _is_in_note: bool = false
var _event_on_open: String

func _ready() -> void:
	if note_ui_container and promt_label and note_text:
		
		note_ui_container.visible = false
		promt_label.text = ""
		
	else:
		printerr("Not all export vars set!")

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact") and _is_in_note:
		_open()
		


func _on_body_entered(_body: Node2D) -> void:
	if _body is Note:
		_is_in_note = true
		promt_label.text = "Press E to read note"
		note_text.text = _body.note_text
		
		if _body.run_event:
			_event_on_open = _body.run_event
	
func _open():
		if _event_on_open:
			EventsStorage.add_event(_event_on_open)
		note_ui_container.visible = true


func _on_body_exited(_body: Node2D) -> void:
	if _body is Note:
		_is_in_note = false
		note_ui_container.visible = false
		promt_label.text = ""
