class_name Map extends TileMap

enum MapEntryPoint {
	INIT_MUSEUM,
	START_0,
	START_FROM_MUSEUM
}

signal transition_player_to_map(MapEntryPoint)
signal teleport_player(pos)

@export var init_map_entry_point: MapEntryPoint
