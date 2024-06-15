extends Node2D

@export var candelabras: Array[Candelabra]
@onready var nr_of_lightened_candelabras = candelabras.size()


func _ready():
	for candelabra in candelabras:
		candelabra.connect("action", _on_candelabra_action)
	set_all_visible(false)

func set_all_visible(value):
	for child in get_children():
		child.visible = value

func _on_candelabra_action(enabled):
	if enabled:
		nr_of_lightened_candelabras += 1
	else:
		nr_of_lightened_candelabras -= 1
	
	if nr_of_lightened_candelabras == 0:
		set_all_visible(true)
	else:
		set_all_visible(false)
