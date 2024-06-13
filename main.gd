extends Node2D

@onready var tilemap: TileMap = $TileMap
@onready var player = $Player
func _unhandled_input(event):
	if event.is_action_pressed('ui_select'):
		tilemap.set_cell(0, player.position / 16, 0, Vector2i(5,5))
