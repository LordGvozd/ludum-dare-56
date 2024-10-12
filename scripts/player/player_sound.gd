extends Node2D
class_name PlayerSound

@export var steps_player: AudioStreamPlayer2D
@export var attack_player: AudioStreamPlayer2D


@export var ground_sounds: Dictionary

var walking: bool = false



func play_attack():
	attack_player.play()

func _process(_delta):
	var tile_maps = get_tree().get_nodes_in_group("ground_tilemaps")
	
	for tile_map in tile_maps:
		if tile_map:
			var tile_pos = tile_map.local_to_map(global_position)
			var tile = tile_map.get_cell_tile_data(tile_pos)
			
			var tile_material = tile.get_custom_data("material")
			
			print(tile_material)
			
			if steps_player.stream != ground_sounds[tile_material]:
				steps_player.stop()
				steps_player.stream = ground_sounds[tile_material]
				steps_player.play()
	
	if steps_player.playing:
		if not walking:
			steps_player.stop()
			
	else:
		if walking:
			steps_player.play()
