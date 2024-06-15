extends Map

func _on_intro_museum_body_entered(_body):
	transition_player_to_map.emit(MapEntryPoint.INIT_MUSEUM)

func _on_teleporter_a_1_teleport():
	teleport_player.emit($TeleporterA2.position)


func _on_teleporter_a_2_teleport():
	teleport_player.emit($TeleporterA1.position)
