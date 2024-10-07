extends Control

@onready var buttons_container: MarginContainer = $"ButtonsContainer"
@onready var settings_container: MarginContainer = $"CenterContainer"
@onready var help_label: Label = $HelpLabel

func _ready() -> void:
	var slider_start_value = 25
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), linear_to_db(slider_start_value))

	
	$"CenterContainer/VBoxContainer/HSlider".value = slider_start_value


func _on_play_pressed():
	get_tree().change_scene_to_file.bind("res://scenes/town.tscn")\
		.call_deferred()
	
	
func _on_exit_pressed():
	get_tree().quit()


func _on_settings_pressed() -> void:
	buttons_container.visible = false
	settings_container.visible = true
	
	$Button.visible = true
	

func _on_button_pressed() -> void:
	buttons_container.visible = true
	settings_container.visible = false
	help_label.visible = false
	
	$Button.visible = false


func _on_h_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), linear_to_db(value / 20))


func _on_help_pressed():
	help_label.visible = true
	buttons_container.visible = false
	$Button.visible = true
