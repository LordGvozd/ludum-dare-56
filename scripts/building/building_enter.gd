extends Node


class_name BuildingEnter


@onready var load_scene_file_path: String = $"..".load_scene_file_path


func _on_building_enter_area_body_entered(body):
	if body is PlayerMovement:
		if FileAccess.file_exists(load_scene_file_path):
			get_tree().change_scene_to_file.bind(load_scene_file_path)\
				.call_deferred()
