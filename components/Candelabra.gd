extends StaticBody2D

# Emits "true" if the lamp is now on, and "false" if it is now off.
signal light(bool)

func _contains_player():
	return $Top.contains_player || $Left.contains_player || $Right.contains_player || $Bottom.contains_player

@onready var point_light = $PointLight2D

func _unhandled_input(event):
	if !_contains_player():
		return
	
	if event.is_action_pressed("action"):
		point_light.enabled = !point_light.enabled
		light.emit(point_light.enabled)
		GlobalStepCounter.take_step()
