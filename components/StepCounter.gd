extends Control

signal no_steps_left

@onready var label = $Label

func _ready():
	GlobalStepCounter.set_step_counter(self)
	set_steps_taken(GlobalStepCounter.steps_taken)

func set_steps_taken(i):
	label.text = str(i)
