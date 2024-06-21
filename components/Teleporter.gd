class_name Teleport extends Node2D

@export var other_teleporter: Teleport

func _contains_player():
	return $ContainsPlayer.contains_player

# We count how long the action key is pressed. If this goes over the threshold,
# we apply the action.
var count_action_treshold = 3
var count_secret_action_threshold = 9
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
	if !_contains_player():
		return
	
	if event.is_action_pressed("action"):
		is_action_pressed = true
		return
	
	if event.is_action_released("action"):
		is_action_pressed = false
		if count_action_hold > count_secret_action_threshold:
			GlobalLevelSwitcher.switch_to_level(GlobalLevelSwitcher.LevelEntryPoint.DAM_FROM_TELEPORT)
		else:
			GlobalTeleportPlayer.teleport_player_to.emit(other_teleporter.position)
		count_action_hold = 0
		count_seconds = 0
