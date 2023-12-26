class_name Dialogue
extends Control

@onready var next_char_timer: Timer = %NextCharTimer
@onready var speaker_label: Label = %SpeakerLabel
@onready var dialogue_rt_label: RichTextLabel = %DialogueRTLabel

@onready var dialogue_lines: Array[Dictionary] = []

var next_line: String = ""
var current_line_index: int = 0


func _ready() -> void:
	self.visible = false
	next_char_timer.wait_time = Globals.text_speed


func set_dialogue_lines(dialogue_array: Array[Dictionary]) -> void:
	dialogue_lines = dialogue_array


func run_dialogue() -> void:
	# End dialogue once there are no more lines
	if current_line_index >= dialogue_lines.size():
		end_dialogue()
		
		return
	
	if Globals.player_state != Globals.PlayerState.TALKING:
		Globals.set_player_state(Globals.PlayerState.TALKING)
	
	if !self.visible:
		self.visible = true
	
	var speaker: String = ""
	
	if (dialogue_lines[current_line_index].has("speaker")):
		speaker = dialogue_lines[current_line_index]["speaker"]
	
	speaker_label.text = speaker
	
	# Complete the line if text is in process of being displayed
	if next_line.length() > 0:
		complete_line()
		
		return
	
	# Instant text reveal
	if Globals.text_speed == 0:
		complete_line()
		
		return
	
	# Start displaying text char by char
	if next_char_timer.is_stopped():
		next_char_timer.start()


func complete_line() -> void:
	if !next_char_timer.is_stopped():
		next_char_timer.stop()
	
	dialogue_rt_label.clear()
	dialogue_rt_label.append_text(dialogue_lines[current_line_index]["line"])
	
	next_line = ""
	current_line_index += 1


func end_dialogue() -> void:
	if !next_char_timer.is_stopped():
		next_char_timer.stop()
	
	self.visible = false
	
	dialogue_lines = []
	next_line = ""
	current_line_index = 0
	
	speaker_label.text = ""
	dialogue_rt_label.clear()
	
	Globals.set_player_state(Globals.PlayerState.MOVE)


func _on_next_char_timer_timeout() -> void:
	var next_char: String = dialogue_lines[current_line_index]["line"][next_line.length()]
	
	next_line += next_char
	
	dialogue_rt_label.clear()
	dialogue_rt_label.append_text(next_line)
	
	if next_line.length() < dialogue_lines[current_line_index]["line"].length():
		next_char_timer.start()
	else:
		current_line_index += 1
		next_line = ""
