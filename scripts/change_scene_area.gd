extends Area2D


@export_file("*.tscn") var scene_path: String


func _on_body_entered(body):
	if body is PlayerMovement:
		get_tree().change_scene_to_file.bind(scene_path)\
				.call_deferred()
