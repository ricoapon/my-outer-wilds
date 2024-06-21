extends Node

signal no_steps_taken
signal took_step
const max_nr_of_steps = 999 # For testing set to a high value.
var steps_taken = 0

var step_counter
func set_step_counter(obj):
	step_counter = obj

func take_step():
	steps_taken += 1
	step_counter.set_steps_taken(steps_taken)
	took_step.emit()
	if steps_taken >= max_nr_of_steps:
		reset()

func reset():
	steps_taken = 0
	no_steps_taken.emit()
