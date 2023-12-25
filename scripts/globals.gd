extends Node

enum Events {
	LEFT_HOSPITAL,
	SPOKE_TO_CAT,
	GOT_ON_TRAIN,
}

var flags: Dictionary


func _ready() -> void:
	# Initialise flags
	for key in Events.keys():
		flags[key] = 0
