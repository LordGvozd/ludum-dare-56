extends Node


@export var spider_movement: SpiderMovement

@onready var player = $"../Player/PlayerMovement"
@onready var spider_animated_sprite: AnimatedSprite2D = $SpiderMovement/SpiderSprite
@onready var spider_collision_shape: CollisionShape2D = $SpiderMovement/SpiderCollisionShape
@onready var spider_attack_collision_shape: CollisionShape2D = $SpiderMovement/SpiderAttackArea/SpiderAttackAreaCollisionShape

var is_alive: bool = true
var is_die_animation_played = false


func _physics_process(_delta):
	if is_alive:
		var player_position = player.global_position
		spider_movement.follow(player_position)
	else:
		spider_attack_collision_shape.disabled = true
		spider_collision_shape.disabled = true
		if not is_die_animation_played:
			spider_animated_sprite.play("died")
			is_die_animation_played = true
