extends Node

signal no_steps_left
const initial_steps_left = 100
var steps_left = initial_steps_left

var step_counter
func set_step_counter(obj):
	step_counter = obj

func take_step():
	steps_left -= 1
	step_counter.set_steps_left(steps_left)
	if steps_left == 0:
		no_steps_left.emit()
		steps_left = initial_steps_left
