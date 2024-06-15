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
# We want to increase the step counter every time a second passes, and not decrease
# by 3 in one step if we release the spacebar. So we have a second variable for this.
var count_seconds = 0

func _process(delta):
	if !is_action_pressed:
		return
	count_action_hold += delta
	count_seconds += delta
	if (count_seconds >= 1):
		GlobalStepCounter.take_step()
		count_seconds -= 1

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
		count_seconds = 0
