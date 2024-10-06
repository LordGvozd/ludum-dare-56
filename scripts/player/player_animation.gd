extends Node


class_name PlayerAnimation2


@export var player_input: PlayerInput

@onready var player_animated_sprite: AnimatedSprite2D = $"../PlayerMovement/PlayerSprite"

var last_direction: Vector2


func _process(_delta) -> void:
	var direction: Vector2 = player_input.get_movement_direction()
		
	# todo refactor
	if direction.x == 1:
		last_direction = direction
		
		player_animated_sprite.flip_h = false
		player_animated_sprite.play("walk_right")
	
	if direction.x == -1:
		last_direction = direction
		
		player_animated_sprite.flip_h = true
		player_animated_sprite.play("walk_right")
		
	if direction.y == 1:
		last_direction = direction
		
		player_animated_sprite.flip_h = false
		player_animated_sprite.play("walk_down")
		
	if direction.y == -1:
		last_direction = direction
		
		player_animated_sprite.flip_h = false
		player_animated_sprite.play("walk_up")

	if direction == Vector2.ZERO:
		player_animated_sprite.flip_h = false
		
		if last_direction.x == 1:
			player_animated_sprite.play("idle_right")
		
		if last_direction.x == -1:
			player_animated_sprite.flip_h = true
			player_animated_sprite.play("idle_right")
		
		if last_direction.y == 1:
			player_animated_sprite.play("idle_down")
			
		if last_direction.y == -1:
			player_animated_sprite.play("idle_up")
