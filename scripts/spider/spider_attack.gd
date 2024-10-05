extends Node


class_name SpiderAttack


func _on_spider_attack_area_body_entered(body):
	if body is PlayerMovement:
		print("KILL")
