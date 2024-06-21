extends Node

signal flood_columns(int)
var current_columns_on_level = 0
var start_flood

func _ready():
	GlobalLevelSwitcher.connect("switch_to_level_signal", on_switch_level)

func on_switch_level(scene: String, playerPosition: Vector2i):
	print()

func increase_flood():
	current_columns_on_level += 1
	flood_columns.emit(current_columns_on_level)

func reset():
	current_columns_on_level = 0
	flood_columns.emit(0)
