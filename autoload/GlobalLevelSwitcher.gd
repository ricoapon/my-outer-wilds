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
	START_INITIAL_POSITION,
	START_FROM_MUSEUM,
	START_FROM_HOUSES,
	START_FROM_FOREST,
	START_FROM_CASTLE,
	MUSEUM_FROM_START,
	MUSEUM_FROM_TOP_FLOOR,
	MUSEUM_TOP_FLOOR_FROM_MUSEUM,
	FOREST_FROM_START,
	FOREST_FROM_DAM,
	FOREST_FROM_MAZE,
	MAZE_FROM_FOREST,
	DAM_FROM_TELEPORT,
	DAM_FROM_FOREST,
	HOUSES_FROM_START,
	HOUSES_FROM_CHAPPEL,
	HOUSES_FROM_HOUSE_CULPRIT,
	HOUSES_FROM_HOUSE_WIZARD,
	HOUSE_CULPRIT_FROM_HOUSES,
	HOUSE_WIZARD_FROM_HOUSES,
	CHAPPEL_FROM_HOUSES,
	CHAPPEL_FROM_CASTLE,
	CASTLE_FROM_START,
	CASTLE_FROM_CHAPPEL,
	CASTLE_FROM_2ND_FLOOR,
	CASTLE_2ND_FLOOR_FROM_CASTLE,
	CASTLE_2ND_FLOOR_FROM_TOP_FLOOR,
	CASTLE_2ND_FLOOR_FROM_SECRET,
	CASTLE_2ND_FLOOR_SECRET,
	CASTLE_TOP_FLOOR,
	MAZE_TOP_FLOOR_FROM_MAZE,
}

var level_entry_point_to_scene = {
	LevelEntryPoint.START_INITIAL_POSITION: "res://maps/Start.tscn",
	LevelEntryPoint.START_FROM_MUSEUM: "res://maps/Start.tscn",
	LevelEntryPoint.START_FROM_HOUSES: "res://maps/Start.tscn",
	LevelEntryPoint.START_FROM_FOREST: "res://maps/Start.tscn",
	LevelEntryPoint.START_FROM_CASTLE: "res://maps/Start.tscn",
	LevelEntryPoint.MUSEUM_FROM_START: "res://maps/Museum.tscn",
	LevelEntryPoint.MUSEUM_FROM_TOP_FLOOR: "res://maps/Museum.tscn",
	LevelEntryPoint.MUSEUM_TOP_FLOOR_FROM_MUSEUM: "res://maps/MuseumTopFloor.tscn",
	LevelEntryPoint.FOREST_FROM_START: "res://maps/Forest.tscn",
	LevelEntryPoint.FOREST_FROM_DAM: "res://maps/Forest.tscn",
	LevelEntryPoint.FOREST_FROM_MAZE: "res://maps/Forest.tscn",
	LevelEntryPoint.MAZE_FROM_FOREST: "res://maps/Maze.tscn",
	LevelEntryPoint.DAM_FROM_TELEPORT: "res://maps/Dam.tscn",
	LevelEntryPoint.DAM_FROM_FOREST: "res://maps/Dam.tscn",
	LevelEntryPoint.HOUSES_FROM_START: "res://maps/Houses.tscn",
	LevelEntryPoint.HOUSES_FROM_CHAPPEL: "res://maps/Houses.tscn",
	LevelEntryPoint.HOUSES_FROM_HOUSE_CULPRIT: "res://maps/Houses.tscn",
	LevelEntryPoint.HOUSES_FROM_HOUSE_WIZARD: "res://maps/Houses.tscn",
	LevelEntryPoint.HOUSE_CULPRIT_FROM_HOUSES: "res://maps/HouseCulprit.tscn",
	LevelEntryPoint.HOUSE_WIZARD_FROM_HOUSES: "res://maps/HouseWizard.tscn",
	LevelEntryPoint.CHAPPEL_FROM_HOUSES: "res://maps/Chappel.tscn",
	LevelEntryPoint.CHAPPEL_FROM_CASTLE: "res://maps/Chappel.tscn",
	LevelEntryPoint.CASTLE_FROM_START: "res://maps/Castle.tscn",
	LevelEntryPoint.CASTLE_FROM_CHAPPEL: "res://maps/Castle.tscn",
	LevelEntryPoint.CASTLE_FROM_2ND_FLOOR: "res://maps/Castle.tscn",
	LevelEntryPoint.CASTLE_2ND_FLOOR_FROM_CASTLE: "res://maps/Castle2ndFloor.tscn",
	LevelEntryPoint.CASTLE_2ND_FLOOR_FROM_TOP_FLOOR: "res://maps/Castle2ndFloor.tscn",
	LevelEntryPoint.CASTLE_2ND_FLOOR_FROM_SECRET: "res://maps/Castle2ndFloor.tscn",
	LevelEntryPoint.CASTLE_2ND_FLOOR_SECRET: "res://maps/Castle2ndFloorSecret.tscn",
	LevelEntryPoint.CASTLE_TOP_FLOOR: "res://maps/CastleTopFloor.tscn",
	LevelEntryPoint.MAZE_TOP_FLOOR_FROM_MAZE: "res://maps/MazeTopFloor.tscn",
}

var map_entry_point_to_player_position = {
	LevelEntryPoint.START_INITIAL_POSITION: Vector2i(18, 9),
	LevelEntryPoint.START_FROM_MUSEUM: Vector2i(7, 8),
	LevelEntryPoint.START_FROM_HOUSES: Vector2i(18, 1),
	LevelEntryPoint.START_FROM_FOREST: Vector2i(1, 9),
	LevelEntryPoint.START_FROM_CASTLE: Vector2i(38, 9),
	LevelEntryPoint.MUSEUM_FROM_START: Vector2i(20, 15),
	LevelEntryPoint.MUSEUM_FROM_TOP_FLOOR: Vector2i(11, 6),
	LevelEntryPoint.MUSEUM_TOP_FLOOR_FROM_MUSEUM: Vector2i(11, 6),
	LevelEntryPoint.FOREST_FROM_START: Vector2i(38, 9),
	LevelEntryPoint.FOREST_FROM_DAM: Vector2i(1, 19),
	LevelEntryPoint.FOREST_FROM_MAZE: Vector2i(14, 14),
	LevelEntryPoint.MAZE_FROM_FOREST: Vector2i(19, 13),
	LevelEntryPoint.DAM_FROM_TELEPORT: Vector2i(29, 15),
	LevelEntryPoint.DAM_FROM_FOREST: Vector2i(38, 20),
	LevelEntryPoint.HOUSES_FROM_START: Vector2i(18, 20),
	LevelEntryPoint.HOUSES_FROM_CHAPPEL: Vector2i(38, 9),
	LevelEntryPoint.HOUSES_FROM_HOUSE_CULPRIT: Vector2i(6, 9),
	LevelEntryPoint.HOUSES_FROM_HOUSE_WIZARD: Vector2i(32, 18),
	LevelEntryPoint.HOUSE_CULPRIT_FROM_HOUSES: Vector2i(19, 13),
	LevelEntryPoint.HOUSE_WIZARD_FROM_HOUSES: Vector2i(19, 13),
	LevelEntryPoint.CHAPPEL_FROM_HOUSES: Vector2i(12, 9),
	LevelEntryPoint.CHAPPEL_FROM_CASTLE: Vector2i(0, 0),
	LevelEntryPoint.CASTLE_FROM_START: Vector2i(0, 0),
	LevelEntryPoint.CASTLE_FROM_CHAPPEL: Vector2i(0, 0),
	LevelEntryPoint.CASTLE_FROM_2ND_FLOOR: Vector2i(0, 0),
	LevelEntryPoint.CASTLE_2ND_FLOOR_FROM_CASTLE: Vector2i(0, 0),
	LevelEntryPoint.CASTLE_2ND_FLOOR_FROM_TOP_FLOOR: Vector2i(0, 0),
	LevelEntryPoint.CASTLE_2ND_FLOOR_FROM_SECRET: Vector2i(0, 0),
	LevelEntryPoint.CASTLE_2ND_FLOOR_SECRET: Vector2i(0, 0),
	LevelEntryPoint.CASTLE_TOP_FLOOR: Vector2i(0, 0),
	LevelEntryPoint.MAZE_TOP_FLOOR_FROM_MAZE: Vector2i(15, 10),
}
