extends Node




func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is PlayerMovement:
		body.player.player_input.input_enable = false
		await get_tree().create_timer(1).timeout
		body.player.kill()
