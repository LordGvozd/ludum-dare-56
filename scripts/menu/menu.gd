extends Control


func _on_play_pressed():
	get_tree().change_scene_to_file.bind("res://scenes/town.tscn")\
		.call_deferred()
	
	
func _on_exit_pressed():
	get_tree().quit()
