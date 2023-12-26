class_name ChoiceButton
extends Button

signal go_to_line_group(next_line_group)

var next_line_group: int


func _on_pressed() -> void:
	self.go_to_line_group.emit(next_line_group)
