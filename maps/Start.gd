extends Map

func _on_intro_museum_body_entered(body):
	transition_player_to_map.emit(MapEntryPoint.INIT_MUSEUM)
