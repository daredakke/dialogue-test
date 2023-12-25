class_name Ui
extends Control

@onready var dialogue: Control = %Dialogue

var sample_dialogue: Array[Dictionary] = [
	{
		"speaker" : "Narrator",
		"line" : "You don’t have to be a musician to inherently feel and understand a song, you don’t have to be a chef to know that being served skirt steak is not the same as filet mignon, and you certainly don’t need to be a dev to know if a game is un-fun and unfinished"
	},
	{
		"line" : "Five fundamental forces at work in the universe: the strong force, the weak force, the electromagnetic force, the gravitational force, and the egg force. They have different ranges and have different strengths."
	},
	{
		"speaker" : "Someone Else",
		"line" : "More sample text, more sample text, more sample text."
	},
]


func _on_play_button_pressed() -> void:
	if dialogue.dialogue_lines.size() == 0:
		dialogue.set_dialogue_lines(sample_dialogue)
		
	dialogue.run_dialogue()


func _on_reset_button_pressed() -> void:
	dialogue.end_dialogue()
	

