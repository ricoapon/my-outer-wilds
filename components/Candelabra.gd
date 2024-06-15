extends StaticBody2D

# Emits "true" if the lamp is now on, and "false" if it is now off.
signal light(bool)

var contains_player = false
@onready var point_light = $PointLight2D

func _on_area_2d_body_entered(body):
	if body.name != "Player":
		return
	contains_player = true

func _on_area_2d_body_exited(body):
	if body.name != "Player":
		return
	contains_player = false

func _unhandled_input(event):
	if !contains_player:
		return
	
	if event.is_action_pressed("action"):
		point_light.enabled = !point_light.enabled
		light.emit(point_light.enabled)
		GlobalStepCounter.take_step()
