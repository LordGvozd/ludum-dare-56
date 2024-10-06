extends Node


class_name SpiderAttack


func _on_spider_attack_area_body_entered(body):
	if body is PlayerMovement:
		get_tree().change_scene_to_file.bind("res://scenes/death_screen.tscn")\
			.call_deferred()
