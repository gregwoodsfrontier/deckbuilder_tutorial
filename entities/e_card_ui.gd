@warning_ignore("missing_tool")
extends Entity

func _init():
	# used to indicate the current UI has base state
	self.add_relationship(Relationship.new(C_HasState.new(), C_Base.new()))

func _on_gui
