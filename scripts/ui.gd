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
	

#func run_dialogue() -> void:
	## End dialogue once there are no more lines
	#if current_line >= sample_dialogue.size():
		#end_dialogue()
		#
		#return
	#
	#if !dialogue.visible:
		#dialogue.visible = true
	#
	#var speaker: String = ""
	#
	#if (sample_dialogue[current_line].has("speaker")):
		#speaker = sample_dialogue[current_line]["speaker"]
	#
	#speaker_label.text = speaker
	#
	## Complete the line if text is in process of being displayed
	#if next_line.length() > 0:
		#complete_line()
		#
		#return
	#
	## Instant text reveal
	#if next_char_timer.wait_time <= 0:
		#complete_line()
		#
		#return
	#
	## Start displaying text char by char
	#if next_char_timer.is_stopped():
		#next_char_timer.start()
#
#
#func complete_line() -> void:
	#if !next_char_timer.is_stopped():
		#next_char_timer.stop()
	#
	#dialogue_rt_label.clear()
	#dialogue_rt_label.append_text(sample_dialogue[current_line]["line"])
	#
	#current_line += 1
	#next_line = ""
#
#
#func end_dialogue() -> void:
	#dialogue.visible = false
	#
	#current_line = 0
	#next_line = ""
	#
	#speaker_label.text = ""
	#dialogue_rt_label.clear()
#
#
#func _on_next_char_timer_timeout() -> void:
	#var next_char: String = sample_dialogue[current_line]["line"][next_line.length()]
	#
	#next_line += next_char
	#
	#dialogue_rt_label.clear()
	#dialogue_rt_label.append_text(next_line)
	#
	#if next_line.length() < sample_dialogue[current_line]["line"].length():
		#next_char_timer.start()
	#else:
		#current_line += 1
		#next_line = ""
		
