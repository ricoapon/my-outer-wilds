extends Node2D

@export var to: Map.MapEntryPoint

# This is set by the parent map, which we can use to signal to the Main.
# TODO: Create global singleton that handles switching maps, so that I don't
# need this construction.
var transition_player_to_map: Signal

func _ready():
	$ContainsPlayer.connect("player_entered", _on_contains_player_player_entered)

func _on_contains_player_player_entered():
	transition_player_to_map.emit(to)
