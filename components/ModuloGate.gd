extends StaticBody2D

@export var modulo: int = 2

func _ready():
	GlobalStepCounter.connect("took_step", on_took_step)

func on_took_step():
	if $ContainsPlayer.contains_player:
		return

	var is_step_count_zero_modulo = (GlobalStepCounter.steps_left % modulo == 0)
	set_visibility(!is_step_count_zero_modulo)

# Used to toggle the sprite and collision.
func set_visibility(value):
	$CollisionShape2D.set_deferred("disabled", !value)
	$GateSprite.visible = value
