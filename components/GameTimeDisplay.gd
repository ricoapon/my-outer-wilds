extends Control

@onready var label = $Label

func _ready():
	GlobalGameTime.set_game_time_display(self)
	set_game_time(GlobalGameTime.current_game_time)

func set_game_time(i: GameTime):
	label.text = 'Day ' + str(i.days) + ' - ' + _prepend_zero(i.hours) + ':' + _prepend_zero(i.minutes)

func _prepend_zero(i):
	if (i < 10):
		return '0' + str(i)
	return str(i)
