@warning_ignore("missing_tool")
extends Entity

func _gui_input(event: InputEvent) -> void:
	if event.is_action_pressed("left_mouse"):
		self.add_component(C_OnGuiInput.new())
