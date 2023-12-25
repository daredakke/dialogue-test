extends Node

enum PlayerState {
	MOVE,
	TALKING
}

var player_state: int = PlayerState.MOVE

const TEXT_SPEED_INSTANT: float = 0
const TEXT_SPEED_FAST: float = 0.01
const TEXT_SPEED_MEDIUM: float = 0.02
const TEXT_SPEED_SLOW: float = 0.03

var text_speed: float = TEXT_SPEED_FAST

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


func set_player_state(new_state) -> void:
	player_state = new_state
