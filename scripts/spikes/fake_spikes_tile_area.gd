extends Area2D


@onready var fake_spikes_animated_sprite: AnimatedSprite2D = $".."


func _on_area_entered(area: Area2D):
	if area.name == "SpikesTriggerArea":
		fake_spikes_animated_sprite.play("inactive")


func _on_area_exited(area):
	if area.name == "SpikesTriggerArea":
		fake_spikes_animated_sprite.play("active")
