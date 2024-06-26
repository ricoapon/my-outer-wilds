# This class handles, by itself, all the flooding for each level.
extends Node

# TODO: determine all the correct values.
# TODO: make Dam and Forest flood in a different way??
const flood_minutes_delay_per_scene = {
	"res://maps/Start.tscn": 40,
	"res://maps/Forest.tscn": 0,
	"res://maps/Houses.tscn": 40,
}

signal starting_flood
signal flood_columns(int)

var start_flood_time = null
var current_scene

func _ready():
	GlobalLevelSwitcher.connect("switch_to_level_signal", on_switch_level)
	GlobalGameTime.connect("minute_passed", _check_flood)
	GlobalGameTime.connect("reset", reset)

func start_flood():
	var now = GlobalGameTime.current_game_time
	start_flood_time = GameTime.new(now.days, now.hours, now.minutes)
	starting_flood.emit()

func is_flooding():
	if start_flood_time == null:
		return false
	return GlobalGameTime.current_game_time.in_minutes() >= start_flood_time.in_minutes()

func on_switch_level(scene: String, _playerPosition: Vector2i):
	# To prevent collision checks when transitioning, we remove all the flooding first.
	flood_columns.emit(0)
	current_scene = scene
	_check_flood()

func _check_flood():
	# If we don't start flooding yet, we do nothing.
	if !is_flooding():
		return
	
	# We are flooding. Determine how many columns we have on our level.
	var level_minutes_of_flooding = GlobalGameTime.current_game_time.in_minutes() - \
			start_flood_time.in_minutes() - flood_minutes_delay_per_scene[current_scene]
	if level_minutes_of_flooding <= 0:
		return
	flood_columns.emit(level_minutes_of_flooding)

func reset():
	flood_columns.emit(0)
	start_flood_time = GameTime.new(0, 23, 6)
