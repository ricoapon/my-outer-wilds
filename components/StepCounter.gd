extends Control

signal no_steps_left

@onready var label = $Label
var steps_left = 100

func _ready():
	label.text = str(steps_left)

func take_step():
	steps_left -= 1
	label.text = str(steps_left)
	if steps_left == 0:
		no_steps_left.emit()
