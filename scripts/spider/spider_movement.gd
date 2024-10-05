extends CharacterBody2D

class_name SpiderMovement


@export var speed: int = 100


func follow(player_position: Vector2) -> void:
	velocity = global_position.direction_to(player_position) * speed
	
	move_and_slide()
	
