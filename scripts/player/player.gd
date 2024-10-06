extends Node2D


@export var player_input: PlayerInput
@export var player_movement: PlayerMovement
@export var player_sound: PlayerSound

@onready var player_attack_area: CollisionShape2D = $PlayerMovement/PlayerAttackArea/PlayerAttackAreaCollisionShape


func _process(_delta) -> void:
	if player_input.is_attack_button_pressed():
		player_attack_area.disabled = false
		

func _physics_process(_delta) -> void:
	var movement_direction: Vector2 = player_input.get_movement_direction()
	
	if movement_direction.x or movement_direction.y:
		player_sound.walking = true
	else:
		player_sound.walking = false
	
	player_movement.move(movement_direction)
