# Changes the LevelMap to the right scene when signal is emitted.
# See https://www.youtube.com/watch?v=In_HYViDstE and the corresponding git repo.
extends Node2D

@onready var level: Node2D = $LevelMap
@onready var player = $Player

var map_entry_point_to_file = {
	Map.MapEntryPoint.INIT_MUSEUM: "res://maps/IntroMuseum.tscn",
	Map.MapEntryPoint.START_0: "res://maps/Start.tscn",
	Map.MapEntryPoint.START_FROM_MUSEUM: "res://maps/Start.tscn"
}

# Vector represents the grid coordinate. Multiply this with grid_size to get the actual position.
var map_entry_point_to_player_position = {
	Map.MapEntryPoint.INIT_MUSEUM: Vector2i(17, 15),
	Map.MapEntryPoint.START_0: Vector2i(30, 11),
	Map.MapEntryPoint.START_FROM_MUSEUM: Vector2i(19, 13)
}

func _ready():
	_on_level_transition_player_to_map(Map.MapEntryPoint.START_0)

func _on_level_transition_player_to_map(map_entry_point):
	# Delete existing level map (if it exists, which is not the case on startup).
	while (level.get_child_count() > 0):
		var child = level.get_children()[0]
		level.remove_child(level.get_children()[0])
		child.queue_free()
	
	# Create new level map.
	var new_level_map: Map = load(map_entry_point_to_file[map_entry_point]).instantiate()
	new_level_map.init_map_entry_point = map_entry_point
	new_level_map.connect("transition_player_to_map", _on_level_transition_player_to_map)
	new_level_map.connect("teleport_player", _on_level_teleport_player)
	
	# Show the new level map on screen.
	level.add_child(new_level_map)
	
	# Move the player to the right position.
	player.position = map_entry_point_to_player_position[map_entry_point] * 16

func _on_level_teleport_player(pos):
	player.position = pos
