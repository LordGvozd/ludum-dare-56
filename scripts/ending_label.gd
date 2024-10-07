extends Control


func _on_earth_animation_finished():
	visible = true
	$"../AnimationPlayer".play("ending_label")
