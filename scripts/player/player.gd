extends Node2D
class_name Player

@export var player_input: PlayerInput
@export var player_movement: PlayerMovement
@export var player_sound: PlayerSound

@export var camera_limiter: CollisionShape2D

@onready var player_attack_area: CollisionShape2D = $PlayerMovement/PlayerAttackArea/PlayerAttackAreaCollisionShape
@onready var player_camera: Camera2D = $PlayerMovement/PlayerCamera


func _ready() -> void:
	
	var shape_size: Vector2 = camera_limiter.shape.size * camera_limiter.global_scale
	
	print(shape_size)
	
	var left_limiter = camera_limiter.global_position.x - shape_size.x  / 2
	var right_limiter = camera_limiter.global_position.x + shape_size.x / 2
	var top_limiter = camera_limiter.global_position.y - shape_size.y / 2
	var bottom_limiter = camera_limiter.global_position.y + shape_size.y / 2
	
	player_camera.limit_left = left_limiter
	player_camera.limit_top = top_limiter
	player_camera.limit_right = right_limiter
	player_camera.limit_bottom = bottom_limiter
	
	print(left_limiter, " " ,
	 	right_limiter, " ", 
		top_limiter, " ",
		bottom_limiter)


func _process(_delta) -> void:
	if player_input.is_attack_button_pressed():
		
		$"PlayerMovement/PlayerSprite".play("attack_down")
		

func _physics_process(_delta) -> void:
	var movement_direction: Vector2 = player_input.get_movement_direction()
	
	if movement_direction.x or movement_direction.y:
		player_sound.walking = true
	else:
		player_sound.walking = false
	
	if not player_input.is_attacking:
		player_movement.move(movement_direction)


func _on_player_sprite_animation_finished() -> void:
	if $"PlayerMovement/PlayerSprite".animation == "attack_down":
		player_attack_area.disabled = false
		player_sound.play_attack()
