extends Node
class_name PlayerSound

@export var steps_player: AudioStreamPlayer2D
var walking: bool = false


func _process(delta):
	if steps_player.playing:
		if not walking:
			steps_player.stop()
			
	else:
		if walking:
			steps_player.play()
