extends Node2D

@export var levelEntryPoint: GlobalLevelSwitcher.LevelEntryPoint

func _on_contains_player_player_entered():
	GlobalLevelSwitcher.switch_to_level(levelEntryPoint)
