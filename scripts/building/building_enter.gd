extends Node
class_name BuildingEnter


@export var building: Building
@onready var animation_player: AnimationPlayer = $"AnimationPlayer"
@export var player_spawn: Node2D

func _on_building_enter_area_body_entered(body):
	if body is PlayerMovement:
		if FileAccess.file_exists(building.load_scene_file_path):
			
			animation_player.play("fade_in")


func _on_animation_player_animation_finished(anim_name):
	get_tree().change_scene_to_file.bind(building.load_scene_file_path)\
		.call_deferred()
