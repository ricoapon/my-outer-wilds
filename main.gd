# Changes the LevelMap to the right scene when signal is emitted.
# See https://www.youtube.com/watch?v=In_HYViDstE and the corresponding git repo.
extends Node2D

@onready var level: Node2D = $LevelMap
@onready var player = $Player

const grid_size = 16

func _ready():
	GlobalStepCounter.connect("no_steps_left", _on_step_counter_no_steps_left)
	GlobalTeleportPlayer.connect("teleport_player_to", _on_teleport_player_to)
	GlobalLevelSwitcher.connect("switch_to_level_signal", _on_level_transition_player_to_map)
	GlobalLevelSwitcher.switch_to_level(GlobalLevelSwitcher.LevelEntryPoint.START_INITIAL_POSITION)

func _on_level_transition_player_to_map(scene: String, playerPosition: Vector2i):
	self.call_deferred("_on_level_transition_player_to_map_deferred", scene, playerPosition)

func _on_level_transition_player_to_map_deferred(scene: String, playerPosition: Vector2i):
	get_tree().paused=true
	player.position = playerPosition * grid_size
	# Delete existing level map (if it exists, which is not the case on startup).
	while (level.get_child_count() > 0):
		var child = level.get_children()[0]
		level.remove_child(child)
		child.free()
	
	# Create new level map.
	var new_level_map = load(scene).instantiate()
	
	# Show the new level map on screen.
	level.add_child(new_level_map)
	
	get_tree().paused=false

func _on_teleport_player_to(pos):
	player.position = pos

func _on_step_counter_no_steps_left():
	get_tree().reload_current_scene()
