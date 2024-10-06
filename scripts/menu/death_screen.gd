extends Control


func _process(_delta) -> void:
	if Input.is_action_just_pressed("attack"):
		get_tree().change_scene_to_file.bind("res://scenes/menu.tscn")\
			.call_deferred()
