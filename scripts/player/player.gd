extends Node2D
class_name Player

@export var player_input: PlayerInput
@export var player_movement: PlayerMovement
@export var player_sound: PlayerSound

@export var camera_limiter: CollisionShape2D


@onready var player_attack_area: CollisionShape2D = $PlayerMovement/PlayerAttackArea/PlayerAttackAreaCollisionShape
@onready var player_camera: PlayerCamera = $PlayerMovement/PlayerCamera


func _ready() -> void:
	player_camera.set_camera_shape(camera_limiter)
	
	player_movement.player = self
	player_input.player = self
	
	
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
		

func kill():
	get_tree().change_scene_to_file.bind("res://scenes/death_screen.tscn")\
			.call_deferred()
