extends Node


@export var leavers: Array[Node2D]
@export var correct_combination: Array[bool]


func _process(_delta):
	var leavers_states: Array[bool] = []
	
	for leaver in leavers:
		leavers_states.append(leaver.is_active)
	
	if leavers_states == correct_combination:
		print("All correct")
