extends Node


@export var parts_root: Control



func _ready() -> void:
	var possible_rotations = [90, 180, 270, -90, -180, -270]
	
	for p: TextureRect in parts_root.get_children():
		var new_rotation = possible_rotations[randi() % possible_rotations.size()]
		p.rotation_degrees = new_rotation
		p.gui_input.connect(func(event): _rotate(event, p))


func _rotate(event: InputEvent, object: TextureRect) -> void:
	if event.is_action_pressed("left_mouse_click"):
		object.rotation_degrees += 90
		if object.rotation_degrees == 360:
			object.rotation_degrees = 0
			
		_check()
		
func _check():
	for p in parts_root.get_children():
		if p.rotation_degrees != 0:
			return
	_solve()
	
func _solve():
	get_tree().quit()
