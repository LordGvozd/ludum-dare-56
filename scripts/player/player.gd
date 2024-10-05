extends Node2D


@export var player_input: PlayerInput
@export var player_movement: PlayerMovement


func _physics_process(_delta) -> void:
	var movement_direction: Vector2 = player_input.get_movement_direction()
	
	player_movement.move(movement_direction)
