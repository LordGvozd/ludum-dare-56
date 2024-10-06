extends Node


class_name PlayerAttack


func _on_player_attack_area_body_entered(body):
	if body is SpiderMovement:
		body.get_parent().is_alive = false
		
