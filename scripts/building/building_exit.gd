extends Area2D


func _on_body_entered(body):
	if body is PlayerMovement:
		get_tree().change_scene_to_file.bind("res://scenes/town.tscn")\
			.call_deferred()
