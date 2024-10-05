extends Node


class_name HouseEnter


@onready var load_scene_file_path: String = $"..".load_scene_file_path


func _on_house_enter_area_body_entered(body):
	if body is PlayerMovement:
		if FileAccess.file_exists(load_scene_file_path):
			get_tree().change_scene_to_file(load_scene_file_path)
