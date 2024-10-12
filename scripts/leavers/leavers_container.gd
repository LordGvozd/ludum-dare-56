extends Node


@export var leavers: Array[Node2D]
@export var correct_combination: Array[bool]
@export var area_to_activate: Area2D

var area_collision_shape: CollisionShape2D

func _ready():
	area_collision_shape = area_to_activate.find_child("ChangeSceneAreaCollisionShape")
	area_collision_shape.disabled = true


func _process(_delta):
	var leavers_states: Array[bool] = []
	
	for leaver in leavers:
		leavers_states.append(leaver.is_active)
	
	if leavers_states == correct_combination:
		area_collision_shape.disabled = false
	else:
		area_collision_shape.disabled = true
