extends Node2D
class_name Player

@export var player_input: PlayerInput
@export var player_movement: PlayerMovement
@export var player_sound: PlayerSound

@export var camera_limit_left: int
@export var camera_limit_top: int
@export var camera_limit_right: int
@export var camera_limit_bottom: int

@onready var player_attack_area: CollisionShape2D = $PlayerMovement/PlayerAttackArea/PlayerAttackAreaCollisionShape
@onready var player_camera: Camera2D = $PlayerMovement/PlayerCamera


func _ready() -> void:
	player_camera.limit_left = camera_limit_left
	player_camera.limit_top = camera_limit_top
	player_camera.limit_right = camera_limit_right
	player_camera.limit_bottom = camera_limit_bottom


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
