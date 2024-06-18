extends Node

# Scenes should use the function to switch to another level. A component that
# handles the level switching should connect this signal and switch if this
# signal is emitted.


# PlayerPosition represents the grid coordinate.
# Multiply this with grid_size to get the actual position.
signal switch_to_level_signal(scene: String, playerPosition: Vector2i)

func switch_to_level(levelEntryPoint: LevelEntryPoint):
	switch_to_level_signal.emit(
		level_entry_point_to_scene[levelEntryPoint],
		map_entry_point_to_player_position[levelEntryPoint]
	)

enum LevelEntryPoint {
	INIT_MUSEUM_FROM_START,
	START_INITIAL_POSITION,
	START_FROM_MUSEUM
}

var level_entry_point_to_scene = {
	LevelEntryPoint.INIT_MUSEUM_FROM_START: "res://maps/IntroMuseum.tscn",
	LevelEntryPoint.START_INITIAL_POSITION: "res://maps/Start.tscn",
	LevelEntryPoint.START_FROM_MUSEUM: "res://maps/Start.tscn"
}

var map_entry_point_to_player_position = {
	LevelEntryPoint.INIT_MUSEUM_FROM_START: Vector2i(17, 15),
	LevelEntryPoint.START_INITIAL_POSITION: Vector2i(30, 11),
	LevelEntryPoint.START_FROM_MUSEUM: Vector2i(19, 13)
}
