extends CharacterBody2D


class_name PlayerMovement


@export var speed: int = 200
@export var acceleration: int = 100


func move(movement_direction: Vector2) -> void:
	velocity.x = move_toward(velocity.x, movement_direction.x * speed, acceleration)
	velocity.y = move_toward(velocity.y, movement_direction.y * speed, acceleration)
	
	move_and_slide()
