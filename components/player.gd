# The movement of the player is done by moving the player itself, moving back the sprite, and
# slow have the sprite move towards the new position. Turn on visibility of Target to see this
# in action. Using this design, we have a movement animation. It is also possible to hold down
# a button, and stay moving in that direction. Moving diagonally is not allowed.
# Using a RayCast and collision detection, we check if movement is possible at all.
# Copied from https://www.youtube.com/watch?v=9u1Dq6h7sGU
extends CharacterBody2D

const grid_pixel_size = 16

var is_moving = false
@onready var sprite = $Sprite2D
@onready var ray_cast = $RayCast
@onready var target = $Target


var input_to_direction = {
	'up': Vector2.UP,
	'down': Vector2.DOWN,
	'left': Vector2.LEFT,
	'right': Vector2.RIGHT
}

func _physics_process(_delta):
	if is_moving == false:
		return
		
	sprite.position = sprite.position.move_toward(target.position, 2.5)
	
	if target.position == sprite.position:
		GlobalGameTime.increase_minute()
		is_moving = false
		return

func _process(_delta):
	if is_moving:
		return

	for input in input_to_direction.keys():
		if Input.is_action_pressed(input):
			move(input_to_direction[input])
			# We only want to process a single direction, so don't check other keys.
			return

func move(direction: Vector2):
	var delta_position = direction * grid_pixel_size
	
	# Check if we can move into the tile we want to move to.
	ray_cast.target_position = delta_position
	ray_cast.force_raycast_update()
	if (ray_cast.is_colliding()):
		# Allow the player to move into the water, so you can kill yourself.
		# This prevents the player from getting stuck.
		if !ray_cast.get_collider().is_in_group("flood"):
			return

	is_moving = true

	# Move the player to the new spot, together with the ray cast poining to the right direction.
	# But we move the sprite back to the old tile, so that this can slowly move towards it.	
	position += delta_position
	sprite.position -= delta_position
