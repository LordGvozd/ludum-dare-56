extends Node


@export var enemy: PackedScene
@export var spawning_points: Array[Node2D]
@export var spawning_time: int

@onready var spawner_timer: Timer = $SpawnerTimer


func _ready() -> void:
	if spawning_time > 0:
		spawner_timer.wait_time = spawning_time


func _on_spawner_timer_timeout():
	var spawning_position = spawning_points.pick_random().global_position
	var enemy_instance = enemy.instantiate()
	
	get_tree().current_scene.add_child(enemy_instance)
	enemy_instance.global_position = spawning_position
