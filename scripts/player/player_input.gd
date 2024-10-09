extends Node


class_name PlayerInput


@onready var player_attack_timer: Timer = $"../PlayerAttackTimer"
@onready var player_attack_area: CollisionShape2D = $"../PlayerMovement/PlayerAttackArea/PlayerAttackAreaCollisionShape"
@onready var player_animated_sprite: AnimatedSprite2D = $"../PlayerMovement/PlayerSprite"

var can_attack: bool = true
var is_attacking: bool = false


func get_movement_direction() -> Vector2:
	var movement_direction: Vector2 = Input.get_vector(
		"left", "right", "up", "down"
	)
	
	return movement_direction


func is_attack_button_pressed() -> bool:
	if can_attack and Input.is_action_just_pressed("attack"):
		can_attack = false
		is_attacking = true
		player_animated_sprite.play("attack")
		player_attack_timer.start()
		
		return true
	else:
		return false   


func is_interact_button_pressed() -> bool:
	if Input.is_action_just_pressed("interact"):
		return true
	else:
		return false


func _on_player_attack_timer_timeout():
	can_attack = true
	is_attacking = false
	player_attack_area.disabled = true
