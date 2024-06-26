extends StaticBody2D

var started_flood = false

func _contains_player():
	return $Top.contains_player || $Left.contains_player || $Right.contains_player || $Bottom.contains_player

func _unhandled_input(event):
	if started_flood:
		return

	if !_contains_player():
		return
	
	if event.is_action_pressed("action"):
		GlobalFlood.start_flood()
		GlobalGameTime.increase_minute()
		$SpriteOff.visible = false
		$SpriteOn.visible = true
		started_flood = true
