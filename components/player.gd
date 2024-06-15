extends CharacterBody2D

@onready var ray = $RayCastDown

var grid_size = 16
var inputs = {
	'ui_up': Vector2.UP,
	'ui_down': Vector2.DOWN,
	'ui_left': Vector2.LEFT,
	'ui_right': Vector2.RIGHT
}

# Funky counter to keep track of how long a key is pressed down.
# Move left every few counts.
var counter = 0
var moveEveryX = 4
func _physics_process(delta):
	for key in inputs.keys():
		if (Input.is_action_pressed(key)):
			counter += 1
			if (counter >= moveEveryX):
				move(key)
				counter = 0

func move(key):
	var vector_pos = inputs[key] * grid_size
	ray.target_position = vector_pos
	ray.force_raycast_update()
	if !ray.is_colliding():
		position += vector_pos
