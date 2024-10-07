extends Node2D


func _on_animation_player_animation_finished(_anim_name):
	EventsStorage.clear_events()
	
	get_tree().change_scene_to_file.bind("res://scenes/menu.tscn")\
		.call_deferred()
