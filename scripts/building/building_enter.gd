extends Node
class_name BuildingEnter


@export var building: Building
@onready var animation_player: AnimationPlayer = $"AnimationPlayer"
@export var player_spawn: Node2D

func _on_building_enter_area_body_entered(body):
	if body is PlayerMovement:
		print(building.load_scene_file_path)
		if FileAccess.file_exists(building.load_scene_file_path):
			SpawningData.town_spawn_position = player_spawn.global_position
			animation_player.play("fade_in")
		else:
			SpawningData.town_spawn_position = player_spawn.global_position
			animation_player.play("fade_in")

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "fade_in":
		get_tree().change_scene_to_file.bind(building.load_scene_file_path)\
			.call_deferred()


func _on_animation_player_animation_changed(old_name: StringName, new_name: StringName) -> void:
	print("OLD_NAME" + old_name)
	print("NEW_NAME" + new_name)
