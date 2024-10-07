extends Area2D


func _on_body_entered(body):
	if body is PlayerMovement:
		$"AnimationPlayer".play("fade_in")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "fade_in":
				get_tree().change_scene_to_file.bind("res://scenes/town.tscn")\
			.call_deferred()
