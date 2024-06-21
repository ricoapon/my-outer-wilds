extends TileMap

@onready var collision = $Area2D/CollisionShape2D

const water_cell_in_atlas = Vector2i(8, 5)

func _ready():
	GlobalFlood.connect("flood_columns", columns)

# Floods x columns on the grid.
func columns(x: int):
	# I thought we would have to multiply by 16, but apparently it should be 32??
	var column_size = 32
	# We have to set x coordinate 1 less, otherwise collision is detected when
	# the player is next to the water instead of in it.
	collision.shape.set_size(Vector2(max(column_size * x - 1, 0), 352))
	
	# Always clear, because if we move to another level, the x value can be different.
	self.clear()
	for i in range (0, x):
		for j in range(0, 22):
			self.set_cell(0, Vector2i(i, j), 0, water_cell_in_atlas, 0)

func _on_area_2d_body_entered(body):
	if body.name != "Player":
		return
	GlobalGameTime.reset_game()
