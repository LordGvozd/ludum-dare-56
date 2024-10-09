extends Area2D


func _ready() -> void:
	print($CanvasLayer/Control/ColorRect.visible)
	$CanvasLayer/Control/ColorRect.visible = true

func _on_body_entered(body):
	if body is PlayerMovement:
		$"AnimationPlayer".play("end")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "end":
		get_tree().change_scene_to_file.bind("res://scenes/ending.tscn")\
				.call_deferred()
	
