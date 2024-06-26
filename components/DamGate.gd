extends StaticBody2D

func _ready():
	GlobalFlood.connect("starting_flood", dissapear)
	if GlobalFlood.is_flooding():
		dissapear()

func dissapear():
	$Sprite.visible = false
