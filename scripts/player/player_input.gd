extends Node


class_name PlayerInput


@onready var player_attack_timer: Timer = $"../PlayerAttackTimer"
@onready var player_attack_area: CollisionShape2D = $"../PlayerMovement/PlayerAttackArea/PlayerAttackAreaCollisionShape"

var can_attack: bool = true


func get_movement_direction() -> Vector2:
	var movement_direction: Vector2 = Input.get_vector(
		"left", "right", "up", "down"
	)
	
	return movement_direction


func is_attack_button_pressed() -> bool:
	if can_attack and Input.is_action_just_pressed("attack"):
		can_attack = false
		player_attack_timer.start()
		
		return true
	else:
		return false   


func _on_player_attack_timer_timeout():
	can_attack = true
	player_attack_area.disabled = true
