extends Node


class_name PlayerInput

var player: Player

var input_enable: bool = true

@onready var player_attack_timer: Timer = $"../PlayerAttackTimer"
@onready var player_attack_area: CollisionShape2D = $"../PlayerMovement/PlayerAttackArea/PlayerAttackAreaCollisionShape"
@onready var player_animated_sprite: AnimatedSprite2D = $"../PlayerMovement/PlayerSprite"

var can_attack: bool = true
var is_attacking: bool = false

func get_movement_direction() -> Vector2:
	if not input_enable:
		return Vector2.ZERO
	
	var movement_direction: Vector2 = Input.get_vector(
		"left", "right", "up", "down"
	)
	
	
	return movement_direction


func is_attack_button_pressed() -> bool:
	if can_attack and Input.is_action_just_pressed("attack") and input_enable:
		can_attack = false
		is_attacking = true
		player_animated_sprite.play("attack")
		player_attack_timer.start()
		
		return true
	else:
		return false   


func _on_player_attack_timer_timeout():
	can_attack = true
	is_attacking = false
	player_attack_area.disabled = true
