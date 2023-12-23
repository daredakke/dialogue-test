class_name Ui
extends Control

@onready var speaker_line_edit: LineEdit = %SpeakerLineEdit
@onready var text_edit: TextEdit = %TextEdit
@onready var speaker_label: Label = %SpeakerLabel
@onready var dialogue_rt_label: RichTextLabel = %DialogueRTLabel


func _on_play_button_pressed() -> void:
	speaker_label.text = speaker_line_edit.text
	
	dialogue_rt_label.clear()
	dialogue_rt_label.append_text(text_edit.text)
