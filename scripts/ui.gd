class_name Ui
extends Control

@onready var dialogue: Control = %Dialogue


func _on_talking_to_npc(lines) -> void:
	Globals.set_player_state(Globals.PlayerState.TALKING)
	
	if dialogue.dialogue_lines.size() == 0:
		dialogue.set_dialogue_lines(lines)
		
	dialogue.run_dialogue()


func _on_reset_button_pressed() -> void:
	dialogue.end_dialogue()
