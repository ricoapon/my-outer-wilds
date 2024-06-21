extends StaticBody2D

@export var modulo: int = 2

func _ready():
	GlobalGameTime.connect("minute_passed", on_minute_passed)

func on_minute_passed():
	if $ContainsPlayer.contains_player:
		return

	var is_time_zero_modulo = (GlobalGameTime.current_game_time.in_minutes() % modulo == 0)
	set_visibility(!is_time_zero_modulo)

# Used to toggle the sprite and collision.
func set_visibility(value):
	$CollisionShape2D.set_deferred("disabled", !value)
	$GateSprite.visible = value
