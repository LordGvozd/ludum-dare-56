extends Node2D

@export var depends_on_event: String

func _ready() -> void:
	var events = EventsStorage.load_events()
	
	if depends_on_event not in events:
		queue_free()
	
	
