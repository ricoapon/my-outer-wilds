extends TileMap

const secret_sequence = ['L', 'L', 'R', 'L', 'L']
var sequence = []

func _on_stairs_left_player_entered():
	sequence.append('L')
	teleport_if_sequence_equals_secret_sequence()
	GlobalTeleportPlayer.teleport_player_to.emit(Vector2(256, 160))

func _on_stairs_right_player_entered():
	sequence.append('R')
	teleport_if_sequence_equals_secret_sequence()
	GlobalTeleportPlayer.teleport_player_to.emit(Vector2(352, 160))

func teleport_if_sequence_equals_secret_sequence():
	for i in sequence.size():
		if sequence[i] != secret_sequence[i]:
			sequence = []
			return
	
	if sequence.size() == secret_sequence.size():
		GlobalLevelSwitcher.switch_to_level(GlobalLevelSwitcher.LevelEntryPoint.MAZE_TOP_FLOOR_FROM_MAZE)
