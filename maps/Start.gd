extends Map


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
