extends Node

signal reset
signal minute_passed
var current_game_time = GameTime.new(0, 23)

var game_time_display
func set_game_time_display(obj):
	game_time_display = obj

func increase_minute():
	current_game_time.increase_minute()
	game_time_display.set_game_time(current_game_time)
	minute_passed.emit()

func reset_game():
	current_game_time = GameTime.new(0, 23)
	reset.emit()
