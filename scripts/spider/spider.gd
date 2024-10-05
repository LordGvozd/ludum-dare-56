extends Node


@export var spider_movement: SpiderMovement

@onready var player = $"../Player/PlayerMovement"


func _physics_process(_delta):
	var player_position = player.global_position
	
	if is_instance_valid(spider_movement):
		spider_movement.follow(player_position)
