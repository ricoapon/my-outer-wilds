extends Node2D

var nr_of_lightened_candelabras

# If true, then by default the object is invisible, and triggering the secret will
# turn it visible. If false, then by default the object is visible, and triggering
# the secret will turn it invisible.
@export var hide_object = true


func _ready():
	# We dynamically find all candelabras in the scene.
	var candelabras = get_tree().get_root().find_children("*", "Candelabra", true, false)
	nr_of_lightened_candelabras = candelabras.size()
	for candelabra in candelabras:
		candelabra.connect("action", _on_candelabra_action)
	set_all_visible(!hide_object)

func set_all_visible(value):
	for child in get_children():
		child.visible = value

func _on_candelabra_action(enabled):
	if enabled:
		nr_of_lightened_candelabras += 1
	else:
		nr_of_lightened_candelabras -= 1
	
	if nr_of_lightened_candelabras == 0:
		set_all_visible(hide_object)
	else:
		set_all_visible(!hide_object)
