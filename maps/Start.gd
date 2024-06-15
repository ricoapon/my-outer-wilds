extends Map

func _ready():
	$TransitionToMap.transition_player_to_map = transition_player_to_map

func _on_teleporter_a_1_teleport():
	teleport_player.emit($TeleporterA2.position)

func _on_teleporter_a_2_teleport():
	teleport_player.emit($TeleporterA1.position)


var nr_of_lightened_candelabras = 2
func _on_candelabra_light(enabled):
	if enabled:
		nr_of_lightened_candelabras += 1
	else:
		nr_of_lightened_candelabras -= 1
	
	if nr_of_lightened_candelabras == 0:
		$HiddenGem.visible = true
	else:
		$HiddenGem.visible = false
