extends Area2D

@export var contains_player: bool = false

func _on_body_entered(body):
	if body.name != "Player":
		return
	contains_player = true


func _on_body_exited(body):
	if body.name != "Player":
		return
	contains_player = false
