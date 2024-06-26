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
# We want to increase the minutes every time 0.5 seconds in real time passes, and not increase
# by 3 in one go if we release the spacebar. So we have a second variable for this.
# We use 0.5 seconds, because that way the player doesn't need to hold it forever.
var count_seconds = 0

func _process(delta):
	if !is_action_pressed:
		return
	count_action_hold += delta
	count_seconds += delta
	if (count_seconds >= 0.5):
		GlobalGameTime.increase_minute()
		count_seconds -= 0.5

func _unhandled_input(event):
	if !_contains_player():
		return
	
	if event.is_action_pressed("action"):
		is_action_pressed = true
		return
	
	if event.is_action_released("action"):
		is_action_pressed = false
		# We increase minutes every 0.5 seconds, so the hold duration is actually twice that much.
		var actual_hold = count_action_hold * 2
		if actual_hold >= count_secret_action_threshold:
			GlobalLevelSwitcher.switch_to_level(GlobalLevelSwitcher.LevelEntryPoint.DAM_FROM_TELEPORT)
		elif actual_hold >= count_action_treshold:
			GlobalTeleportPlayer.teleport_player_to.emit(other_teleporter.position)
		count_action_hold = 0
		count_seconds = 0
