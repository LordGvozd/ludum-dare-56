extends Area2D

@export var event: String 


func _ready() -> void:
	if event in EventsStorage.load_events():
		queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body is PlayerMovement:
		EventsStorage.add_event(event)
		queue_free()
