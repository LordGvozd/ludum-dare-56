extends Node

@export var player: Player

func _ready() -> void:
	if SpawningData.town_spawn_position:
		player.player_movement.global_position = SpawningData.town_spawn_position
		$AnimationPlayer.play("fade_out")
