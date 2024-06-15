extends Map

func _on_start_body_entered(body):
	transition_player_to_map.emit(MapEntryPoint.START_FROM_MUSEUM)
