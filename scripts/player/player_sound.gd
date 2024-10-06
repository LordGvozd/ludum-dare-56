extends Node
class_name PlayerSound

@export var steps_player: AudioStreamPlayer2D
@export var attack_player: AudioStreamPlayer2D

var walking: bool = false

func play_attack():
	attack_player.play()

func _process(_delta):
	if steps_player.playing:
		if not walking:
			steps_player.stop()
			
	else:
		if walking:
			steps_player.play()
