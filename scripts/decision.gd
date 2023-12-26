class_name Decision
extends Control

@onready var decision_panel: DecisionPanel = $DecisionPanel
@onready var decision_v_box: VBoxContainer = %DecisionVBox


func _ready() -> void:
	remove_choices()
	decision_panel.set_height_and_position()
	self.visible = false


func remove_choices() -> void:
	for n in decision_v_box.get_children():
		decision_v_box.remove_child(n)
		n.queue_free()
