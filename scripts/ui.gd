class_name Ui
extends Control

@onready var dialogue: Control = %Dialogue
@onready var speaker_label: Label = %SpeakerLabel
@onready var dialogue_rt_label: RichTextLabel = %DialogueRTLabel
@onready var next_char_timer: Timer = %NextCharTimer

const TEXT_SPEED_INSTANT: float = 0
const TEXT_SPEED_FAST: float = 0.01
const TEXT_SPEED_MEDIUM: float = 0.02
const TEXT_SPEED_SLOW: float = 0.03

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

var sample_speaker: String = "Narrator"
var sample_text: String = "Here is a test sentence."
var npc_id: int = 1
var next_line: String = ""
var current_line: int = 0


func _ready() -> void:
	next_char_timer.wait_time = TEXT_SPEED_FAST


func _on_play_button_pressed() -> void:	
	run_dialogue()


func _on_reset_button_pressed() -> void:
	end_dialogue()
	

func run_dialogue() -> void:
	# End dialogue once there are no more lines
	if current_line >= sample_dialogue.size():
		end_dialogue()
		
		return
	
	if !dialogue.visible:
		dialogue.visible = true
	
	var speaker: String = ""
	
	if (sample_dialogue[current_line].has("speaker")):
		speaker = sample_dialogue[current_line]["speaker"]
	
	speaker_label.text = speaker
	
	# Complete the line if text is in process of being displayed
	if next_line.length() > 0:
		complete_line()
		
		return
	
	# Instant text reveal
	if next_char_timer.wait_time <= 0:
		complete_line()
		
		return
	
	# Start displaying text char by char
	if next_char_timer.is_stopped():
		next_char_timer.start()


func complete_line() -> void:
	if !next_char_timer.is_stopped():
		next_char_timer.stop()
	
	dialogue_rt_label.clear()
	dialogue_rt_label.append_text(sample_dialogue[current_line]["line"])
	
	current_line += 1
	next_line = ""


func end_dialogue() -> void:
	dialogue.visible = false
	
	current_line = 0
	next_line = ""
	
	speaker_label.text = ""
	dialogue_rt_label.clear()


func _on_next_char_timer_timeout() -> void:
	var next_char: String = sample_dialogue[current_line]["line"][next_line.length()]
	
	next_line += next_char
	
	dialogue_rt_label.clear()
	dialogue_rt_label.append_text(next_line)
	
	if next_line.length() < sample_dialogue[current_line]["line"].length():
		next_char_timer.start()
	else:
		current_line += 1
		next_line = ""
		
