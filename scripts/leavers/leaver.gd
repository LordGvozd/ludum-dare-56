extends Node2D


var is_active: bool = false
var player_in_area: bool = false


func _process(_delta):
	if get_node("../Player/PlayerInput").is_interact_button_pressed() and player_in_area:
		is_active = !is_active


func _on_leaver_area_body_entered(body):
	if body is PlayerMovement:
		body.get_node("%Prompt").text = "Press E to pull leaver"
		
		player_in_area = true


func _on_leaver_area_body_exited(body):
	if body is PlayerMovement:
		body.get_node("%Prompt").text = ""
		
		player_in_area = false
