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
	START_FROM_MUSEUM,
	START_TOP,
	START_BOTTOM,
	START_LEFT,
	START_RIGHT,
	CASTLE_GATES_FROM_BOTTOM,
	CASTLE_GATES_FROM_TOP,
	CASTLE_GATES_FROM_RIGHT,
	CASTLE_GATES_TOP_FLOOR,
	CASTLE_GATES_SECRET,
}

var level_entry_point_to_scene = {
	LevelEntryPoint.INIT_MUSEUM_FROM_START: "res://maps/IntroMuseum.tscn",
	LevelEntryPoint.START_INITIAL_POSITION: "res://maps/Start.tscn",
	LevelEntryPoint.START_FROM_MUSEUM: "res://maps/Start.tscn",
	LevelEntryPoint.START_TOP: "res://maps/Start.tscn",
	LevelEntryPoint.START_BOTTOM: "res://maps/Start.tscn",
	LevelEntryPoint.START_LEFT: "res://maps/Start.tscn",
	LevelEntryPoint.START_RIGHT: "res://maps/Start.tscn",
	LevelEntryPoint.CASTLE_GATES_FROM_BOTTOM: "res://maps/CastleGates.tscn",
	LevelEntryPoint.CASTLE_GATES_FROM_TOP: "res://maps/CastleGates.tscn",
	LevelEntryPoint.CASTLE_GATES_FROM_RIGHT: "res://maps/CastleGates.tscn",
	LevelEntryPoint.CASTLE_GATES_TOP_FLOOR: "res://maps/CastleGates_Top.tscn",
	LevelEntryPoint.CASTLE_GATES_SECRET: "res://maps/CastleGates_Secret.tscn",
}

var map_entry_point_to_player_position = {
	LevelEntryPoint.INIT_MUSEUM_FROM_START: Vector2i(17, 15),
	LevelEntryPoint.START_INITIAL_POSITION: Vector2i(18, 9),
	LevelEntryPoint.START_FROM_MUSEUM: Vector2i(7, 8),
	LevelEntryPoint.START_TOP: Vector2i(18, 1),
	LevelEntryPoint.START_BOTTOM: Vector2i(18, 20),
	LevelEntryPoint.START_LEFT: Vector2i(1, 9),
	LevelEntryPoint.START_RIGHT: Vector2i(38, 9),
	LevelEntryPoint.CASTLE_GATES_FROM_BOTTOM: Vector2i(19, 17),
	LevelEntryPoint.CASTLE_GATES_FROM_TOP: Vector2i(31, 6),
	LevelEntryPoint.CASTLE_GATES_FROM_RIGHT: Vector2i(38, 11),
	LevelEntryPoint.CASTLE_GATES_TOP_FLOOR: Vector2i(21, 7),
	LevelEntryPoint.CASTLE_GATES_SECRET: Vector2i(1, 11),
}
