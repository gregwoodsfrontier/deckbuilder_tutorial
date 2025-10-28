@warning_ignore("missing_tool")
extends Entity

func _init():
	# used to indicate the current UI has base state
	self.add_relationship(Relationship.new(C_HasState.new(), C_Base.new()))

func _gui_input(event: InputEvent) -> void:
	if event.is_action_pressed("left_mouse"):
		print("gui_input")
