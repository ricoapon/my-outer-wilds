extends Node2D

signal teleport

var contains_player = false

func _on_area_2d_body_entered(body):
	contains_player = true

func _on_area_2d_body_exited(body):
	contains_player = false

# We count how long the action key is pressed. If this goes over the threshold,
# we apply the action.
var count_action_treshold = 3
var is_action_pressed = false
var count_action_hold = 0

func _process(delta):
	if !is_action_pressed:
		return
	count_action_hold += delta

func _unhandled_input(event):
	if !contains_player:
		return
	
	if event.is_action_pressed("action"):
		is_action_pressed = true
		return
	
	if event.is_action_released("action"):
		is_action_pressed = false
		if count_action_hold > count_action_treshold:
			teleport.emit()
		count_action_hold = 0
