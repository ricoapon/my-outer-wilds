class_name Map extends TileMap

enum MapEntryPoint {
	INIT_MUSEUM,
	START_0,
	START_FROM_MUSEUM
}

func _ready():
	# TODO: This only works because I only have one transition to map.
	# This needs to be done in a cleaner way... I can think of two things:
	# 1. export array which contains all transitions to map.
	# 2. Global (autoload) that makes it possible to switch maps.
	$TransitionToMap.transition_player_to_map = transition_player_to_map

signal transition_player_to_map(MapEntryPoint)

@export var init_map_entry_point: MapEntryPoint
