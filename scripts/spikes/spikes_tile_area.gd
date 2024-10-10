extends Area2D


func _on_area_entered(area):
	if area.name == "SpikesTriggerArea":
		get_tree().change_scene_to_file.bind("res://scenes/death_screen.tscn")\
			.call_deferred()
