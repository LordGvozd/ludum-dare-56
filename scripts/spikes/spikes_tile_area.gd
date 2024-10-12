extends Area2D


@onready var spikes_timer: Timer = get_parent().get_parent().get_parent().get_node("SpikesTimer")


func _on_area_entered(area):
	if area.name == "SpikesTriggerArea" and spikes_timer == null:
		get_tree().change_scene_to_file.bind("res://scenes/death_screen.tscn")\
			.call_deferred()
