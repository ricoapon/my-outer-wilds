extends Control

signal no_steps_left

@onready var label = $Label

func _ready():
	GlobalStepCounter.set_step_counter(self)
	set_steps_left(GlobalStepCounter.steps_left)

func set_steps_left(i):
	label.text = str(i)
