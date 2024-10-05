extends Node


class_name PlayerInput


func get_movement_direction() -> Vector2:
	var movement_direction: Vector2 = Input.get_vector(
		"left", "right", "up", "down"
	)
	
	return movement_direction
