# Changes the LevelMap to the right scene when signal is emitted.
# See https://www.youtube.com/watch?v=In_HYViDstE and the corresponding git repo.
extends Node2D

@onready var level: Node2D = $LevelMap
@onready var player = $Player

const grid_size = 16

# If we transition levels, and the final square of the player contained a TransitionToMap
# node in the new level, then it would immediately activate. To avoid this from happening,
# we disable player collision, and trigger it when level loading is done.
signal level_switch_complete

func _ready():
	GlobalStepCounter.connect("no_steps_left", _on_step_counter_no_steps_left)
	GlobalTeleportPlayer.connect("teleport_player_to", _on_teleport_player_to)
	GlobalLevelSwitcher.connect("switch_to_level_signal", _on_level_transition_player_to_map)
	self.connect("level_switch_complete", _on_level_switch_complete)
	GlobalLevelSwitcher.switch_to_level(GlobalLevelSwitcher.LevelEntryPoint.START_INITIAL_POSITION)
	

func _on_level_transition_player_to_map(scene: String, playerPosition: Vector2i):
	self.call_deferred("_on_level_transition_player_to_map_deferred", scene, playerPosition)


func _on_level_transition_player_to_map_deferred(scene: String, playerPosition: Vector2i):
	# Disable player collision
	player.set_collision_layer(0)
	player.set_collision_mask(0)

	# Move player to the right position on the new level.
	player.position = playerPosition * grid_size

	# Delete existing level map (if it exists, which is not the case on startup).
	while (level.get_child_count() > 0):
		var child = level.get_children()[0]
		level.remove_child(child)
		child.queue_free()

	# Create new level map.
	var new_level_map = load(scene).instantiate()
	
	# Show the new level map on screen.
	level.add_child(new_level_map)

	# Allow some time for the scene to fully load and the player's position to be set before enabling collisions
	await get_tree().create_timer(0.1).timeout
	emit_signal("level_switch_complete")

func _on_level_switch_complete():
	# Re-enable player collision
	player.set_collision_layer(1)
	player.set_collision_mask(1)


func _on_teleport_player_to(pos):
	player.position = pos

func _on_step_counter_no_steps_left():
	get_tree().call_deferred("reload_current_scene")
	GlobalFlood.reset()
