class_name PlayButton
extends Button

signal talking_to_npc(lines: Array[Dictionary])

var npc_lines: Array[Dictionary] = [
	{
		"speaker" : "Some Guy",
		"line" : "You don’t have to be a musician to inherently feel and understand a song, you don’t have to be a chef to know that being served skirt steak is not the same as filet mignon, and you certainly don’t need to be a dev to know if a game is un-fun and unfinished"
	},
	{
		"line" : "I think this guy is crazy."
	},
	{
		"speaker" : "Some Guy",
		"line" : "Five fundamental forces at work in the universe: the strong force, the weak force, the electromagnetic force, the gravitational force, and the egg force. They have different ranges and have different strengths."
	},
]


func _on_pressed() -> void:
	self.talking_to_npc.emit(npc_lines)
