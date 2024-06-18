extends TileMap

@onready var wizard = $Wizard
@onready var hold_counter = $HoldCounter
var hold = 0

func _ready():
	GlobalStepCounter.connect("took_step", move_wizard)

func move_wizard():
	var x = wizard.position.x / 16
	
	# Move the wizard left until it reaches the teleport.
	if x < 13:
		wizard.position += Vector2(1, 0) * 16
		return
	
	# It reached the teleport, so now we are going to show 1,2,3.
	hold += 1
	if hold <= 3:
		hold_counter.visible = true
		_set_hold_counter(hold)
		return
	
	# Teleport to start
	hold = 0
	wizard.position -= Vector2(3, 0) * 16
	hold_counter.visible = false

func _set_hold_counter(value):
	hold_counter.texture.region = Rect2(560 + value * 16, 272, 16, 16)
