extends Node2D

@export var doors_parent: Node2D
@export var correct_doors: Array[Area2D]


var _player_way_is_wrong: bool = false

func _ready() -> void:
	for d: Area2D in doors_parent.get_children():
		d.body_entered.connect(func(_body): _on_player_entered_the_door(_body,
		 d))


func _on_player_entered_the_door(body, door) -> void:
	if door not in correct_doors:
		_player_way_is_wrong = true
		
