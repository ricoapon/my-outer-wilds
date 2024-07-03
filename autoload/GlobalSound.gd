extends Node

enum Song {
	BACKGROUND_MUSIC,
	FLOOD
}

# I edited the songs a little to make them loop better.
const songToAsset = {
	Song.BACKGROUND_MUSIC: "res://assets/OneManSymphony-Wreckage/ADifferentKindOfJourney.mp3",
	Song.FLOOD: "res://assets/OneManSymphony-Wreckage/BlackHoles.mp3"
}

signal play(asset: String)

func _ready():
	GlobalFlood.connect("starting_flood", starting_flood)

func play_song(song: Song):
	play.emit(songToAsset[song])

func starting_flood():
	play_song(Song.FLOOD)
