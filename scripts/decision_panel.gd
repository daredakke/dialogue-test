class_name DecisionPanel
extends Panel

const BUTTON_HEIGHT: int = 31
const MARGIN: int = 16

@onready var decision_v_box: VBoxContainer = %DecisionVBox


func _ready() -> void:
	set_height_and_position()


func set_height_and_position() -> void:
	var child_count: int = decision_v_box.get_child_count()
	var separation = decision_v_box.get_theme_constant("separation")
	
	var height: int = (BUTTON_HEIGHT * child_count) + (MARGIN * 2) + (separation * (child_count - 1))
	
	self.size.y = height
	self.position.y = (get_viewport_rect().size.y * 0.5) - (height * 0.5)
