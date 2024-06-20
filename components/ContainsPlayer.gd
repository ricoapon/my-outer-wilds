class_name ContainsPlayer extends Area2D

@export var contains_player: bool = false

signal player_entered

func _on_body_entered(body):
	if body.name != "Player":
		return
	contains_player = true
	print("Player", body.position, "Self", get_parent().position)
	player_entered.emit()

func _on_body_exited(body):
	if body.name != "Player":
		return
	contains_player = false
