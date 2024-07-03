extends AudioStreamPlayer2D

func _ready():
	GlobalSound.connect("play", play_song)

func play_song(song: String):
	self.set_stream(load(song))
	self.play()
