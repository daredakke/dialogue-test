class_name PlayButton
extends Button

signal talking_to_npc(lines: Array)

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

# line_groups -> line_group (-> line (-> choice))
var line_groups: Array = [
	# Group 0
	[
		{
			"speaker": "Some Guy",
			"line": "0 line A",
		},
		{
			"speaker": "Some Guy",
			"line": "0 line B",
		},
		{
			"speaker": "Some Guy",
			"line": "What to do?",
			"decision": [
				{
					"choice": "Choice A",
					"nextLineGroup": 1
				},
				{
					"choice": "Choice B",
					"nextLineGroup": 2
				},
				{
					"choice": "END",
					"nextLineGroup": 3
				},
			]
		},
	],
	# Group 1
	[
		{
			"speaker": "Some Guy",
			"line": "1 line A",
		},
	],
	# Group 2
	[
		{
			"speaker": "Some Guy",
			"line": "2 line A",
		},
		{
			"speaker": "Some Guy",
			"line": "2 line B",
		},
	],
	# Group 3 - empty to end dialogue if such a choice is available
	[]
]

var current_line_group: int = 0


func _on_pressed() -> void:
	self.talking_to_npc.emit(line_groups[current_line_group])
